function [M, msg] = parse_matrix(str, name)
% 解析文本为数值矩阵，行以分号或换行分隔，元素以空格或逗号分隔
    if nargin < 2
        name = '矩阵';
    end
    M = [];
    msg = '';
    if ischar(str) || isstring(str)
        raw = char(str);
    elseif iscell(str)
        raw = strvjoin_cell(str);
    elseif isnumeric(str)
        M = str;
        return;
    else
        msg = sprintf('%s 输入格式无法识别', name);
        return;
    end
    if size(raw, 1) > 1
        raw = strjoin(cellstr(raw)', newline);
    end
    raw = strrep(raw, newline, ';');
    raw = strrep(raw, sprintf('\r'), ';');
    raw = regexprep(raw, ';\s*;+', ';');
    raw = strtrim(raw);
    raw = regexprep(raw, '^\[', '');
    raw = regexprep(raw, '\]$', '');
    raw = strtrim(raw);
    if isempty(raw)
        msg = sprintf('%s 为空，请输入数据', name);
        return;
    end
    rows = strsplit(raw, ';');
    data = {};
    ncol = 0;
    for i = 1:numel(rows)
        r = strtrim(rows{i});
        if isempty(r)
            continue;
        end
        parts = regexp(strtrim(r), '[\s,]+', 'split');
        vals = zeros(1, numel(parts));
        for j = 1:numel(parts)
            v = str2double(parts{j});
            if isnan(v)
                msg = sprintf('%s 第 %d 行第 %d 列 "%s" 不是合法数值', name, i, j, parts{j});
                return;
            end
            vals(j) = v;
        end
        if ncol == 0
            ncol = numel(vals);
        elseif numel(vals) ~= ncol
            msg = sprintf('%s 第 %d 行列数为 %d，与首行 %d 不一致', name, i, numel(vals), ncol);
            return;
        end
        data{end + 1} = vals; %#ok<AGROW>
    end
    if isempty(data)
        msg = sprintf('%s 未解析到有效数据', name);
        return;
    end
    M = zeros(numel(data), ncol);
    for i = 1:numel(data)
        M(i, :) = data{i};
    end
end

function s = strvjoin_cell(c)
% 将字符元胞拼接为换行分隔字符串，数值元胞按列拼接
    c = c(:)';
    if all(cellfun(@ischar, c))
        s = strjoin(c, newline);
        return;
    end
    tmp = cell(size(c, 2), 1);
    for j = 1:size(c, 2)
        tmp{j} = strjoin(cellfun(@num2str, c(:, j)', 'UniformOutput', false), ' ');
    end
    s = strjoin(tmp', ';');
end

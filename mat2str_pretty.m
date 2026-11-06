function s = mat2str_pretty(M)
% 矩阵按对齐格式转为多行字符串，便于显示在文本控件中
    if isempty(M)
        s = '（空矩阵）';
        return;
    end
    fmt = '%-13.6g';
    lines = cell(size(M, 1) + 2, 1);
    lines{1} = sprintf('维度: %d x %d', size(M, 1), size(M, 2));
    for i = 1:size(M, 1)
        row = '';
        for j = 1:size(M, 2)
            row = [row sprintf(fmt, M(i, j))]; %#ok<AGROW>
        end
        lines{i + 1} = row;
    end
    lines{end} = '';
    s = strjoin(lines(1:end - 1), newline);
end

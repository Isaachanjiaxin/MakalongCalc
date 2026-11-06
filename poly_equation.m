function s = poly_equation(p)
% 由系数向量生成多项式方程字符串
    n = numel(p) - 1;
    terms = {};
    for k = 1:numel(p)
        pw = n - (k - 1);
        c = p(k);
        if abs(c) < 1e-10
            continue;
        end
        cs = sprintf('%.4g', c);
        if pw == 0
            terms{end + 1} = cs; %#ok<AGROW>
        elseif pw == 1
            terms{end + 1} = sprintf('%s*x', cs); %#ok<AGROW>
        else
            terms{end + 1} = sprintf('%s*x^%d', cs, pw); %#ok<AGROW>
        end
    end
    if isempty(terms)
        s = 'y = 0';
        return;
    end
    s = ['y = ' terms{1}];
    for k = 2:numel(terms)
        t = terms{k};
        if t(1) == '-'
            s = [s ' - ' t(2:end)]; %#ok<AGROW>
        else
            s = [s ' + ' t]; %#ok<AGROW>
        end
    end
end

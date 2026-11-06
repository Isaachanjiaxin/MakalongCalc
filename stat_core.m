function S = stat_core(X)
% 逐列基本统计量，输入 X 为数值矩阵
    X = X(:);
    X = X(~isnan(X));
    if isempty(X)
        S = [];
        return;
    end
    S = struct();
    S.n = numel(X);
    S.max = max(X);
    S.min = min(X);
    S.mean = mean(X);
    S.median = median(X);
    if numel(X) > 1
        S.var = var(X, 1);
        S.std = std(X, 1);
        S.varU = var(X, 0);
        S.stdU = std(X, 0);
    else
        S.var = 0; S.std = 0; S.varU = 0; S.stdU = 0;
    end;
    S.range = S.max - S.min;
    S.sum = sum(X);
end

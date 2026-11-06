function R = fit_poly(x, y, order)
% 多项式最小二乘拟合，返回系数、方程串、R^2 与拟合曲线采样
    R = struct('ok', false, 'msg', '', 'p', [], 'eq', '', 'r2', NaN, ...
               'xq', [], 'yq', [], 'yhat', [], 'rmse', NaN);
    x = x(:); y = y(:);
    if numel(x) ~= numel(y)
        R.msg = 'X 与 Y 长度不一致'; return;
    end
    valid = ~isnan(x) & ~isnan(y);
    x = x(valid); y = y(valid);
    if numel(x) < order + 1
        R.msg = sprintf('有效数据点 %d 个，不足 %d 阶拟合所需', numel(x), order); return;
    end
    if order < 0 || order ~= floor(order)
        R.msg = '拟合阶数必须为非负整数'; return;
    end
    if numel(unique(x)) < order + 1
        R.msg = '自变量存在重复取值过多，无法完成该阶拟合'; return;
    end
    p = polyfit(x, y, order);
    yhat = polyval(p, x);
    ssr = sum((y - yhat).^2);
    sst = sum((y - mean(y)).^2);
    if sst > 0
        R.r2 = 1 - ssr / sst;
    else
        R.r2 = 1;
    end
    R.rmse = sqrt(ssr / numel(x));
    R.p = p;
    R.yhat = yhat;
    R.eq = poly_equation(p);
    xq = linspace(min(x), max(x), 400)';
    R.xq = xq;
    R.yq = polyval(p, xq);
    R.ok = true;
end

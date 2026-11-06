function C = stl_lcm(A, B)
% 左半张量积：A 列数非 B 行数整数倍时，对 B 行方向补零至 lcm 倍数
    if isempty(A) || isempty(B)
        C = [];
        return;
    end
    [m, n] = size(A);
    [p, q] = size(B);
    k = ceil(p / n);
    t = k * n;
    B2 = zeros(t, q);
    B2(1:p, :) = B;
    C = A * B2;
end

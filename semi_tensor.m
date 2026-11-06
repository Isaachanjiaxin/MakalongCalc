function C = semi_tensor(A, B)
% 第一型矩阵半张量积
    if isempty(A) || isempty(B)
        C = [];
        return;
    end
    [m, n] = size(A);
    [p, q] = size(B);
    t = lcm(n, p);
    A2 = zeros(m, t);
    A2(:, 1:n) = A;
    B2 = zeros(t, q);
    B2(1:p, :) = B;
    C = A2 * B2;
end

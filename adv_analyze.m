function txt = adv_analyze(A)
% 计算矩阵全部高级分析指标并返回报告文本
    L = {};
    [m, n] = size(A);
    isSq = (m == n);

    L{end + 1} = '====== 矩阵高级分析 ======';
    L{end + 1} = '';
    L{end + 1} = '【输入矩阵】';
    L{end + 1} = mat2str_pretty(A);
    L{end + 1} = '';

    L{end + 1} = '【行列式与秩】';
    if isSq
        d = det(A);
        L{end + 1} = sprintf('det(A) = %.6g', d);
        if abs(d) < 1e-12
            L{end + 1} = '提示：行列式接近 0，矩阵接近奇异。';
        end
    else
        L{end + 1} = 'det(A)：矩阵非方阵，行列式无定义。';
    end
    r = rank(A);
    L{end + 1} = sprintf('rank(A) = %d', r);
    L{end + 1} = sprintf('满秩性：%s', tern(r == min(m, n), '满秩', '不满秩'));
    L{end + 1} = '';

    L{end + 1} = '【逆矩阵】';
    if ~isSq
        L{end + 1} = '矩阵非方阵，不可求逆。';
    elseif rcond(A) < 1e-12
        L{end + 1} = sprintf('当前矩阵不可逆（rcond = %.3g，矩阵奇异或接近奇异）。', rcond(A));
    else
        L{end + 1} = 'inv(A) =';
        L{end + 1} = mat2str_pretty(inv(A));
        L{end + 1} = sprintf('rcond(A) = %.6g', rcond(A));
    end
    L{end + 1} = '';

    L{end + 1} = '【条件数】';
    c2 = cond(A);
    L{end + 1} = sprintf('cond_2(A)   = %.6g', c2);
    L{end + 1} = sprintf('cond_1(A)   = %.6g', cond(A, 1));
    L{end + 1} = sprintf('cond_inf(A) = %.6g', cond(A, inf));
    if c2 > 1e12
        L{end + 1} = '提示：条件数过大，矩阵病态，求解结果可能不可靠。';
    end
    L{end + 1} = '';

    L{end + 1} = '【特征值与特征向量】';
    if isSq
        e = eig(A);
        for k = 1:numel(e)
            L{end + 1} = sprintf('λ%d = %s', k, fmt_cplx(e(k))); %#ok<AGROW>
        end
        L{end + 1} = sprintf('谱半径 ρ(A) = %.6g', max(abs(e)));
        [V, D] = eig(A);
        L{end + 1} = '';
        L{end + 1} = '特征向量矩阵 V（按列）：';
        L{end + 1} = mat2str_pretty(V);
        L{end + 1} = '特征值对角矩阵 D：';
        L{end + 1} = mat2str_pretty(D);
        L{end + 1} = sprintf('验证 ||AV - VD|| = %.3g', norm(A * V - V * D));
    else
        L{end + 1} = '矩阵非方阵，特征值与特征向量不适用。';
    end
    L{end + 1} = '';

    L{end + 1} = '【矩阵范数】';
    L{end + 1} = sprintf('2 范数（谱范数）     = %.6g', norm(A, 2));
    L{end + 1} = sprintf('1 范数（列和最大）   = %.6g', norm(A, 1));
    L{end + 1} = sprintf('inf 范数（行和最大） = %.6g', norm(A, inf));
    L{end + 1} = sprintf('Frobenius 范数       = %.6g', norm(A, 'fro'));
    L{end + 1} = sprintf('核范数（奇异值之和） = %.6g', sum(svd(A)));
    L{end + 1} = '';

    L{end + 1} = '【迹】';
    if isSq
        L{end + 1} = sprintf('trace(A) = %.6g', trace(A));
    else
        L{end + 1} = sprintf('trace(A) = %.6g（非方阵为各主对角线元素之和）', trace(A));
    end

    txt = strjoin(L, newline);
end

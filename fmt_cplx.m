function s = fmt_cplx(v)
% 复数按实部虚部格式输出
    if abs(imag(v)) < 1e-10
        s = sprintf('%.6g', real(v));
    else
        s = sprintf('%.6g %+.6gi', real(v), imag(v));
    end
end

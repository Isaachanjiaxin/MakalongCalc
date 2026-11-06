function start()
% 安全启动 GUIDE 应用，并把启动结果写入 startup_log.txt
    here = fileparts(mfilename('fullpath'));
    if isempty(here), here = pwd; end
    cd(here);
    addpath(here);

    logFile = fullfile(here,'startup_log.txt');
    fid = fopen(logFile,'w');
    if fid < 0
        fid = 1;
    end
    cleanup = onCleanup(@() closeLog(fid)); %#ok<NASGU>

    fprintf(fid,'MATLAB: %s\n',version);
    fprintf(fid,'PWD: %s\n',pwd);
    fprintf(fid,'CalcPlatform: %s\n',which('CalcPlatform'));
    fprintf(fid,'CalcPlatform.fig: %s\n',which('CalcPlatform.fig'));

    try
        CalcPlatform;
        fprintf(fid,'CalcPlatform 返回成功\n');
    catch ME
        fprintf(fid,'启动异常:\n%s\n',getReport(ME));
        fprintf(2,'启动异常:\n%s\n',getReport(ME));
        return;
    end

    drawnow;
    f = findall(0,'Type','figure','Tag','figure1');
    if isempty(f)
        fprintf(fid,'未找到主窗口 figure1\n');
        fprintf(2,'未找到主窗口 figure1\n');
        return;
    end

    set(f(1),'Visible','on');
    try
        set(f(1),'WindowState','normal');
    catch
    end
    figure(f(1));
    movegui(f(1),'center');
    drawnow;

    fprintf(fid,'主窗口: Visible=%s, WindowState=%s\n', ...
        get(f(1),'Visible'),get(f(1),'WindowState'));
    fprintf('启动完成，日志：%s\n',logFile);
end

function closeLog(fid)
    if fid > 2
        fclose(fid);
    end
end

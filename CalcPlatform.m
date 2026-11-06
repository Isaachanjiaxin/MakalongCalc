function varargout = CalcPlatform(varargin)
% CALCPLATFORM MATLAB code for CalcPlatform.fig
%      CALCPLATFORM, by itself, creates a new CALCPLATFORM or raises the existing
%      singleton*.
%
%      H = CALCPLATFORM returns the handle to a new CALCPLATFORM or the handle to
%      the existing singleton*.
%
%      CALCPLATFORM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALCPLATFORM.M with the given input arguments.
%
%      CALCPLATFORM('Property','Value',...) creates a new CALCPLATFORM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CalcPlatform_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CalcPlatform_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CalcPlatform

% Last Modified by GUIDE v2.5 05-Nov-2026 21:07:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CalcPlatform_OpeningFcn, ...
                   'gui_OutputFcn',  @CalcPlatform_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before CalcPlatform is made visible.
end

function CalcPlatform_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CalcPlatform (see VARARGIN)

% Choose default command line output for CalcPlatform
handles.output = hObject;

% 初始化页面和共享数据
handles.pages = [handles.page1, handles.page2, handles.page3, handles.page4, ...
                 handles.page5, handles.page6, handles.page7, handles.page8, handles.page9];
handles.navButtons = [handles.btnNav1, handles.btnNav2, handles.btnNav3, ...
                      handles.btnNav4, handles.btnNav5, handles.btnNav6, ...
                      handles.btnNav7, handles.btnNav8, handles.btnNav9];
n = 20;
x = (1:n)';
y = x + 2*sin(x/3) + 0.35*randn(n,1);
y2 = 5*cos(x/4);
handles.data = struct('x',x,'y',y,'y2',y2,'source','系统示例数据');

guidata(hObject,handles);
switchPage(hObject,1);
refreshDataTable(handles);
refreshStats(handles);
setStatus(handles,'系统已启动，请选择左侧功能模块');
set(hObject,'Visible','on');
try
    set(hObject,'WindowState','normal');
catch
end
figure(hObject);
movegui(hObject,'center');
drawnow;

% UIWAIT makes CalcPlatform wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
end

function varargout = CalcPlatform_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
end

function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end

function edPlot3DFunc_Callback(hObject, eventdata, handles)
% hObject    handle to edPlot3DFunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edPlot3DFunc as text
%        str2double(get(hObject,'String')) returns contents of edPlot3DFunc as a double


% --- Executes on selection change in popPlot3D.
end

function popPlot3D_Callback(hObject, eventdata, handles)
% hObject    handle to popPlot3D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popPlot3D contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popPlot3D


% --- Executes on button press in btnPlot3DDraw.
end

function btnPlot3DDraw_Callback(hObject, eventdata, handles)
% hObject    handle to btnPlot3DDraw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

draw3D(handles);


% --- Executes during object creation, after setting all properties.
end

function axPlot3D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axPlot3D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axPlot3D


% --- Executes during object creation, after setting all properties.
end

function lblStatus_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lblStatus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in btnNav1.
end

function btnNav1_Callback(hObject, eventdata, handles)
% hObject    handle to btnNav1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

switchPage(hObject,1);


% --- Executes on button press in btnNav2.
end

function btnNav2_Callback(hObject, eventdata, handles)
% hObject    handle to btnNav2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

switchPage(hObject,2);


% --- Executes on button press in btnNav3.
end

function btnNav3_Callback(hObject, eventdata, handles)
% hObject    handle to btnNav3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

switchPage(hObject,3);


% --- Executes on button press in btnNav4.
end

function btnNav4_Callback(hObject, eventdata, handles)
% hObject    handle to btnNav4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

switchPage(hObject,4);


% --- Executes on button press in btnNav5.
end

function btnNav5_Callback(hObject, eventdata, handles)
% hObject    handle to btnNav5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

switchPage(hObject,5);


% --- Executes on button press in btnNav6.
end

function btnNav6_Callback(hObject, eventdata, handles)
% hObject    handle to btnNav6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

switchPage(hObject,6);


% --- Executes on button press in btnNav7.
end

function btnNav7_Callback(hObject, eventdata, handles)
% hObject    handle to btnNav7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

switchPage(hObject,7);


% --- Executes on button press in btnNav8.
end

function btnNav8_Callback(hObject, eventdata, handles)
% hObject    handle to btnNav8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

switchPage(hObject,8);


% --- Executes on button press in btnNav9.
end

function btnNav9_Callback(hObject, eventdata, handles)
% hObject    handle to btnNav9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

switchPage(hObject,9);


% --- Executes on button press in btnExit.
end

function btnExit_Callback(hObject, eventdata, handles)
% hObject    handle to btnExit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

choice = questdlg('确定要退出系统吗？','退出确认','退出','取消','取消');
if strcmp(choice,'退出')
    delete(handles.figure1);
end


% --- Executes on button press in btnHelp.
end

function btnHelp_Callback(hObject, eventdata, handles)
% hObject    handle to btnHelp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

helpdlg(sprintf(['1. 左侧导航切换模块；\n' ...
    '2. 矩阵输入支持空格、逗号或分号；\n' ...
    '3. 数据管理提供共享数据；\n' ...
    '4. 统计、拟合和二维绘图读取共享数据；\n' ...
    '5. 三维绘图使用 X、Y 变量。']),'使用帮助');


% --- Executes on button press in btnAbout.
end

function btnAbout_Callback(hObject, eventdata, handles)
% hObject    handle to btnAbout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

helpdlg(sprintf(['MATLAB 科学计算与数据可视化综合平台\n' ...
    '版本：V2.0（GUIDE）\n\n' ...
    '组长：韩家薪\n组员：王梓乔、王圣尧、陈振冬、杨子涵']),'关于系统');


% --- Executes during object creation, after setting all properties.
end

function page1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to page1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
end

function page2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to page2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end

function edMatrixA_Callback(hObject, eventdata, handles)
% hObject    handle to edMatrixA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edMatrixA as text
%        str2double(get(hObject,'String')) returns contents of edMatrixA as a double
end

function edMatrixB_Callback(hObject, eventdata, handles)
% hObject    handle to edMatrixB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edMatrixB as text
%        str2double(get(hObject,'String')) returns contents of edMatrixB as a double


% --- Executes on selection change in popMatrixOp.
end

function popMatrixOp_Callback(hObject, eventdata, handles)
% hObject    handle to popMatrixOp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popMatrixOp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popMatrixOp


% --- Executes on button press in btnMatrixCalc.
end

function btnMatrixCalc_Callback(hObject, eventdata, handles)
% hObject    handle to btnMatrixCalc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

matrixCalc(hObject,handles);


% --- Executes on button press in btnMatrixClear.
end

function btnMatrixClear_Callback(hObject, eventdata, handles)
% hObject    handle to btnMatrixClear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

matrixClear(hObject,handles);
end

function edMatrixResult_Callback(hObject, eventdata, handles)
% hObject    handle to edMatrixResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edMatrixResult as text
%        str2double(get(hObject,'String')) returns contents of edMatrixResult as a double
end

function edAdvInput_Callback(hObject, eventdata, handles)
% hObject    handle to edAdvInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edAdvInput as text
%        str2double(get(hObject,'String')) returns contents of edAdvInput as a double


% --- Executes on button press in btnAdvAnalyze.
end

function btnAdvAnalyze_Callback(hObject, eventdata, handles)
% hObject    handle to btnAdvAnalyze (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

advAnalyze(hObject,handles);
end

function edAdvResult_Callback(hObject, eventdata, handles)
% hObject    handle to edAdvResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edAdvResult as text
%        str2double(get(hObject,'String')) returns contents of edAdvResult as a double


% --- Executes during object creation, after setting all properties.
end

function page3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to page3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end

function edLinearA_Callback(hObject, eventdata, handles)
% hObject    handle to edLinearA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edLinearA as text
%        str2double(get(hObject,'String')) returns contents of edLinearA as a double
end

function edLinearB_Callback(hObject, eventdata, handles)
% hObject    handle to edLinearB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edLinearB as text
%        str2double(get(hObject,'String')) returns contents of edLinearB as a double


% --- Executes on button press in btnLinearSolve.
end

function btnLinearSolve_Callback(hObject, eventdata, handles)
% hObject    handle to btnLinearSolve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

linearSolve(hObject,handles);
end

function edLinearResult_Callback(hObject, eventdata, handles)
% hObject    handle to edLinearResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edLinearResult as text
%        str2double(get(hObject,'String')) returns contents of edLinearResult as a double


% --- Executes during object creation, after setting all properties.
end

function page4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to page4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in btnDataRandom.
end

function btnDataRandom_Callback(hObject, eventdata, handles)
% hObject    handle to btnDataRandom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

dataRandom(hObject,handles);


% --- Executes on button press in btnDataAdd.
end

function btnDataAdd_Callback(hObject, eventdata, handles)
% hObject    handle to btnDataAdd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

dataAdd(hObject,handles);


% --- Executes on button press in btnDataDelete.
end

function btnDataDelete_Callback(hObject, eventdata, handles)
% hObject    handle to btnDataDelete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

dataDelete(hObject,handles);


% --- Executes on button press in btnDataClear.
end

function btnDataClear_Callback(hObject, eventdata, handles)
% hObject    handle to btnDataClear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

dataClear(hObject,handles);
end

function edDataRows_Callback(hObject, eventdata, handles)
% hObject    handle to edDataRows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edDataRows as text
%        str2double(get(hObject,'String')) returns contents of edDataRows as a double


% --- Executes during object creation, after setting all properties.
end

function tblData_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tblData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
end

function page5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to page5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
end

function tblStats_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tblStats (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in btnFitRun.
end

function btnFitRun_Callback(hObject, eventdata, handles)
% hObject    handle to btnFitRun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

drawFit(handles);


% --- Executes during object creation, after setting all properties.
end

function axFit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axFit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axFit


% --- Executes during object creation, after setting all properties.
end

function page7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to page7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in btnPlot2DDraw.
end

function btnPlot2DDraw_Callback(hObject, eventdata, handles)
% hObject    handle to btnPlot2DDraw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

draw2D(handles);


% --- Executes during object creation, after setting all properties.
end

function page9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to page9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end


% --- Executes on button press in btnStatsRefresh.
function btnStatsRefresh_Callback(hObject, eventdata, handles)
% hObject    handle to btnStatsRefresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

refreshStats(handles);
drawStats(handles);
setStatus(handles,'统计量已刷新');
end

% --- Executes on selection change in popStatsData.
function popStatsData_Callback(hObject, eventdata, handles)
% hObject    handle to popStatsData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

refreshStats(handles);
drawStats(handles);
end

% --- Executes on selection change in popStatsPlot.
function popStatsPlot_Callback(hObject, eventdata, handles)
% hObject    handle to popStatsPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

refreshStats(handles);
drawStats(handles);
end

function tblData_CellEditCallback(hObject, eventdata, handles) %#ok<INUSD>
d = get(hObject,'Data');
if isempty(d), return; end
handles = ensureHandles(hObject);
handles.data.x = d(:,1);
handles.data.y = d(:,2);
handles.data.y2 = d(:,3);
handles.data.source = '表格手工编辑';
guidata(hObject,handles);
refreshDataTable(handles);
setStatus(handles,'表格数据已更新');
end

% ---------------- 页面切换与状态 ----------------
function switchPage(hObject, idx)
handles = guidata(hObject);
for k = 1:numel(handles.pages)
    if k == idx
        set(handles.pages(k),'Visible','on');
        set(handles.navButtons(k),'BackgroundColor',[0.24 0.60 0.88],'ForegroundColor',[1 1 1]);
    else
        set(handles.pages(k),'Visible','off');
        set(handles.navButtons(k),'BackgroundColor',[0.16 0.22 0.31], ...
            'ForegroundColor',[0.82 0.87 0.94]);
    end
end
guidata(hObject,handles);
end

function setStatus(handles,msg)
set(handles.lblStatus,'String',sprintf('%s   |   %s',datestr(now,'yyyy-mm-dd HH:MM:SS'),msg));
end

% ---------------- 数据与文本 ----------------
function s = editText(h)
v = get(h,'String');
if iscell(v)
    s = strjoin(v,newline);
else
    s = v;
end
end

function setEditText(h,txt)
if isempty(txt)
    set(h,'String',{''});
else
    set(h,'String',strsplit(char(txt),newline));
end
end

function refreshDataTable(handles)
d = [handles.data.x(:), handles.data.y(:), handles.data.y2(:)];
set(handles.tblData,'Data',d);
set(handles.lblDataSource,'String',['数据源：' handles.data.source]);
set(handles.lblDataInfo,'String',sprintf('样本数：%d   |   数据源：%s', ...
    numel(handles.data.x),handles.data.source));
set(handles.lblStatsSource,'String',['当前数据：' handles.data.source]);
end

function vals = selectedColumn(handles)
items = get(handles.popStatsData,'String');
idx = get(handles.popStatsData,'Value');
switch items{idx}
    case 'Y2', vals = handles.data.y2;
    case 'Y',  vals = handles.data.y;
    otherwise, vals = handles.data.x;
end
vals = vals(:);
vals = vals(~isnan(vals));
end

function refreshStats(handles)
vals = selectedColumn(handles);
if isempty(vals)
    set(handles.tblStats,'Data',{'提示','当前没有可用数据'});
    return;
end
S = stat_core(vals);
names = {'样本数','最大值','最小值','均值','中位数','方差（总体）', ...
         '标准差（总体）','极差','总和'};
nums = [S.n;S.max;S.min;S.mean;S.median;S.var;S.std;S.range;S.sum];
set(handles.tblStats,'Data',[names(:),num2cell(nums(:))]);
end

function drawStats(handles)
vals = selectedColumn(handles);
ax = handles.axStats;
axes(ax); cla(ax);
if isempty(vals)
    title(ax,'暂无数据'); return;
end
items = get(handles.popStatsPlot,'String');
idx = get(handles.popStatsPlot,'Value');
switch items{idx}
    case '柱状图'
        bar(ax,vals,'FaceColor',[0.24 0.60 0.88],'EdgeColor','none');
        title(ax,'数据柱状图');
    case '直方图'
        histogram(ax,vals,'FaceColor',[0.98 0.68 0.18],'EdgeColor','none');
        title(ax,'数据直方图');
    otherwise
        plot(ax,vals,'-o','Color',[0.24 0.60 0.88], ...
            'MarkerFaceColor',[0.98 0.68 0.18]);
        title(ax,'数据序列');
end
xlabel(ax,'样本序号'); ylabel(ax,'数值'); grid(ax,'on');
setStatus(handles,'统计图已刷新');
end

% ---------------- 矩阵模块 ----------------
function matrixCalc(hObject,handles)
[A,msg] = parse_matrix(editText(handles.edMatrixA),'矩阵 A');
if ~isempty(msg), errordlg(msg,'矩阵 A 输入错误'); return; end
op = get(handles.popMatrixOp,'Value');
ops = get(handles.popMatrixOp,'String');
opName = ops{op};

needsB = ~any(op == [5 6 7]);
if needsB
    [B,msg] = parse_matrix(editText(handles.edMatrixB),'矩阵 B');
    if ~isempty(msg), errordlg(msg,'矩阵 B 输入错误'); return; end
end

try
    switch op
        case 1
            if ~isequal(size(A),size(B)), error('A 与 B 的维数必须相同'); end
            C = A + B;
        case 2
            if ~isequal(size(A),size(B)), error('A 与 B 的维数必须相同'); end
            C = A - B;
        case 3
            C = semi_tensor(A,B);
        case 4
            if ~isequal(size(A),size(B)), error('A 与 B 的维数必须相同'); end
            C = A .* B;
        case 5
            C = A';
        case 6
            if size(A,1) ~= size(A,2), error('矩阵幂要求 A 为方阵'); end
            C = A^2;
        case 7
            C = A.^2;
    end
    if needsB
        txt = sprintf('【运算】%s\n\n【矩阵 A】\n%s\n\n【矩阵 B】\n%s\n\n【结果】\n%s', ...
            opName,mat2str_pretty(A),mat2str_pretty(B),mat2str_pretty(C));
    else
        txt = sprintf('【运算】%s\n\n【矩阵 A】\n%s\n\n【结果】\n%s', ...
            opName,mat2str_pretty(A),mat2str_pretty(C));
    end
    setEditText(handles.edMatrixResult,txt);
    setStatus(handles,['矩阵运算完成：' opName]);
catch ME
    errordlg(ME.message,'矩阵运算错误');
end
end

function matrixClear(hObject,handles) %#ok<INUSD>
set(handles.edMatrixA,'String',{''});
set(handles.edMatrixB,'String',{''});
set(handles.edMatrixResult,'String',{''});
setStatus(handles,'矩阵输入与结果已清空');
end

function advAnalyze(hObject,handles) %#ok<INUSD>
[A,msg] = parse_matrix(editText(handles.edAdvInput),'矩阵 A');
if ~isempty(msg), errordlg(msg,'输入错误'); return; end
try
    setEditText(handles.edAdvResult,adv_analyze(A));
    setStatus(handles,'矩阵高级分析完成');
catch ME
    errordlg(ME.message,'分析错误');
end
end

function linearSolve(hObject,handles) %#ok<INUSD>
[A,msg] = parse_matrix(editText(handles.edLinearA),'系数矩阵 A');
if ~isempty(msg), errordlg(msg,'A 输入错误'); return; end
[b,msg] = parse_matrix(editText(handles.edLinearB),'常数向量 b');
if ~isempty(msg), errordlg(msg,'b 输入错误'); return; end
b = b(:);
if size(A,1) ~= numel(b)
    errordlg(sprintf('A 的行数 %d 与 b 的长度 %d 不一致',size(A,1),numel(b)),'维数不匹配');
    return;
end
ra = rank(A); rab = rank([A b]); n = size(A,2);
ax = handles.axLinear; axes(ax); cla(ax);
if ra < rab
    txt = sprintf('【判定】rank(A) = %d，rank([A b]) = %d\n方程组无解。',ra,rab);
elseif ra < n
    txt = sprintf('【判定】rank(A) = rank([A b]) = %d < 未知数个数 %d\n方程组有无穷多解。',ra,n);
else
    x = A\b;
    txt = sprintf('【判定】rank(A) = rank([A b]) = %d = 未知数个数\n方程组有唯一解。\n\n【解向量】\n%s', ...
        ra,mat2str_pretty(x));
    plot(ax,1:numel(x),x,'-o','Color',[0.24 0.60 0.88], ...
        'MarkerFaceColor',[0.98 0.68 0.18],'LineWidth',1.5);
    grid(ax,'on'); xlabel(ax,'未知数序号'); ylabel(ax,'解分量'); title(ax,'线性方程组解向量');
end
setEditText(handles.edLinearResult,txt);
setStatus(handles,'线性方程组求解完成');
end

% ---------------- 数据管理 ----------------
function dataRandom(hObject,handles)
n = round(str2double(get(handles.edDataRows,'String')));
if isnan(n) || n < 3
    n = 20; set(handles.edDataRows,'String','20');
end
x = (1:n)';
y = x + 2*sin(x/3) + 0.35*randn(n,1);
y2 = 5*cos(x/4);
handles.data = struct('x',x,'y',y,'y2',y2,'source','随机生成数据');
guidata(hObject,handles);
refreshDataTable(handles);
setStatus(handles,sprintf('已随机生成 %d 行数据',n));
end

function dataAdd(hObject,handles)
if isempty(handles.data.x)
    handles.data = struct('x',1,'y',0,'y2',0,'source','手工添加数据');
else
    handles.data.x(end+1,1) = handles.data.x(end) + 1;
    handles.data.y(end+1,1) = 0;
    handles.data.y2(end+1,1) = 0;
    handles.data.source = '手工添加数据';
end
guidata(hObject,handles);
refreshDataTable(handles);
setStatus(handles,'已添加一行数据');
end

function dataDelete(hObject,handles)
if isempty(handles.data.x), return; end
handles.data.x(end) = [];
handles.data.y(end) = [];
handles.data.y2(end) = [];
handles.data.source = '手工删除数据';
guidata(hObject,handles);
refreshDataTable(handles);
setStatus(handles,'已删除最后一行数据');
end

function dataClear(hObject,handles)
handles.data = struct('x',zeros(0,1),'y',zeros(0,1),'y2',zeros(0,1),'source','空数据');
guidata(hObject,handles);
refreshDataTable(handles);
setStatus(handles,'数据已清空');
end

% ---------------- 拟合与绘图 ----------------
function drawFit(handles)
order = round(str2double(get(handles.edFitOrder,'String')));
if isnan(order), order = 2; set(handles.edFitOrder,'String','2'); end
R = fit_poly(handles.data.x,handles.data.y,order);
if ~R.ok
    errordlg(R.msg,'拟合失败'); return;
end
ax = handles.axFit; axes(ax); cla(ax);
plot(ax,handles.data.x,handles.data.y,'o','Color',[0.80 0.86 0.93], ...
    'MarkerFaceColor',[0.24 0.60 0.88],'MarkerSize',5); hold(ax,'on');
plot(ax,R.xq,R.yq,'-','Color',[0.98 0.68 0.18],'LineWidth',2); hold(ax,'off');
grid(ax,'on'); xlabel(ax,'X'); ylabel(ax,'Y');
title(ax,sprintf('%d 阶多项式拟合',order));
set(handles.lblFitEq,'String',['拟合方程：' R.eq]);
set(handles.lblFitMetrics,'String',sprintf('R² = %.4f     RMSE = %.4f     数据点 = %d', ...
    R.r2,R.rmse,numel(handles.data.x)));
setStatus(handles,sprintf('拟合完成，R² = %.4f',R.r2));
end

function draw2D(handles)
x = handles.data.x(:); y = handles.data.y(:);
ax = handles.axPlot2D; axes(ax); cla(ax);
items = get(handles.popPlot2D,'String'); idx = get(handles.popPlot2D,'Value');
switch items{idx}
    case '折线图'
        plot(ax,x,y,'-o','Color',[0.24 0.60 0.88], ...
            'MarkerFaceColor',[0.98 0.68 0.18],'LineWidth',1.5);
    case '散点图'
        scatter(ax,x,y,36,[0.24 0.60 0.88],'filled');
    case '柱状图'
        bar(ax,x,y,'FaceColor',[0.24 0.60 0.88],'EdgeColor','none');
    case '阶梯图'
        stairs(ax,x,y,'Color',[0.98 0.68 0.18],'LineWidth',1.5);
    case '面积图'
        area(ax,x,y,'FaceColor',[0.24 0.60 0.88],'FaceAlpha',0.35, ...
            'EdgeColor',[0.24 0.60 0.88]);
    case '半对数图'
        semilogy(ax,x,abs(y)+eps,'-o','Color',[0.24 0.60 0.88], ...
            'MarkerFaceColor',[0.98 0.68 0.18]);
end
grid(ax,'on'); xlabel(ax,'X'); ylabel(ax,'Y'); title(ax,items{idx});
setStatus(handles,['已绘制：' items{idx}]);
end

function draw3D(handles)
expr = get(handles.edPlot3DFunc,'String');
try
    f = str2func(['@(X,Y)' expr]);
    xg = linspace(-5,5,70); yg = linspace(-5,5,70);
    [X,Y] = meshgrid(xg,yg); Z = f(X,Y);
catch ME
    errordlg(['函数表达式无法计算：' ME.message],'三维绘图错误'); return;
end
ax = handles.axPlot3D; axes(ax); cla(ax);
items = get(handles.popPlot3D,'String'); idx = get(handles.popPlot3D,'Value');
switch items{idx}
    case 'surf'
        surf(ax,X,Y,Z,'EdgeColor','none'); shading(ax,'interp');
    case 'mesh'
        mesh(ax,X,Y,Z);
    case 'surfc'
        surfc(ax,X,Y,Z,'EdgeColor','none');
    case 'contour'
        contour(ax,X,Y,Z,18);
    case 'waterfall'
        waterfall(ax,X,Y,Z);
end
colormap(ax,parula); colorbar(ax); view(ax,3); grid(ax,'on');
xlabel(ax,'X'); ylabel(ax,'Y'); zlabel(ax,'Z');
title(ax,['z = ' expr],'Interpreter','none');
setStatus(handles,['三维绘图完成：' items{idx}]);
end

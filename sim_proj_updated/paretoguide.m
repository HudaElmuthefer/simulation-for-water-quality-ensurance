function varargout = paretoguide(varargin)
% PARETOGUIDE
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @paretoguide_OpeningFcn, ...
                   'gui_OutputFcn',  @paretoguide_OutputFcn, ...
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

% --- Init GUI
function paretoguide_OpeningFcn(hObject, ~, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

set(hObject, 'Units', 'normalized');
figPos = get(hObject, 'Position');
newHeight = figPos(4) * 1.20;
set(hObject, 'Position', [figPos(1), figPos(2), figPos(3), newHeight]);
scale = figPos(4) / newHeight;

% تنسيق الازرار والقوائم
allBtns = findall(hObject, 'Style', 'pushbutton');
for k = 1:numel(allBtns)
    set(allBtns(k), 'Units', 'normalized');
    p = get(allBtns(k), 'Position');
    set(allBtns(k), 'Position', [p(1), (p(2) * scale) + (1 - scale), p(3), p(4) * scale]);
end

allPopups = findall(hObject, 'Style', 'popupmenu');
for k = 1:numel(allPopups)
    set(allPopups(k), 'Units', 'normalized');
    p = get(allPopups(k), 'Position');
    set(allPopups(k), 'Position', [p(1), (p(2) * scale) + (1 - scale), p(3), p(4) * scale]);
end

% اضافة ازرار جديدة
helpBtn = [];
for k = 1:numel(allBtns)
    s = get(allBtns(k), 'String');
    if strcmpi(strtrim(s), 'Help')
        helpBtn = allBtns(k);
        break;
    end
end

if ~isempty(helpBtn)
    set(helpBtn, 'String', 'Water Quality Index (WQI)', 'Callback', 'plot_wqi;');
    uicontrol('Parent', hObject, 'Style', 'pushbutton', 'String', 'AI Analysis (Random Forest)', ...
        'Units', 'normalized', 'Position', [0.15, 0.10, 0.70, 0.07], ...
        'BackgroundColor', [0.13 0.60 0.40], 'ForegroundColor', [1 1 1], ...
        'FontWeight', 'bold', 'FontSize', 11, 'Callback', 'ai_random_forest;');
    uicontrol('Parent', hObject, 'Style', 'pushbutton', 'String', 'Help', ...
        'Units', 'normalized', 'Position', [0.42, 0.02, 0.16, 0.07], ...
        'BackgroundColor', [0.494 0.184 0.557], 'ForegroundColor', [1 1 1], ...
        'FontWeight', 'bold', 'FontSize', 11, 'Callback', 'try; winopen(''help.txt''); catch; edit(''help.txt''); end');
else
    uicontrol('Parent', hObject, 'Style', 'pushbutton', 'String', 'AI Analysis (Random Forest)', ...
        'Units', 'normalized', 'Position', [0.15, 0.10, 0.70, 0.07], ...
        'BackgroundColor', [0.13 0.60 0.40], 'ForegroundColor', [1 1 1], ...
        'FontWeight', 'bold', 'FontSize', 11, 'Callback', 'ai_random_forest;');
    uicontrol('Parent', hObject, 'Style', 'pushbutton', 'String', 'Water Quality Index (WQI)', ...
        'Units', 'normalized', 'Position', [0.15, 0.02, 0.70, 0.07], ...
        'BackgroundColor', [0.494 0.184 0.557], 'ForegroundColor', [1 1 1], ...
        'FontWeight', 'bold', 'FontSize', 11, 'Callback', 'plot_wqi;');
end

function varargout = paretoguide_OutputFcn(~, ~, handles) 
varargout{1} = handles.output;

% --- Callbacks
function parametersploting_Callback(~, ~, ~)
plotting

function paretotable_Callback(~, ~, ~)
paretotable

function paretodiagram_Callback(~, ~, ~)
paretoplot

function firstpriority_Callback(~, ~, ~)
firstpriority

function secondpriority_Callback(~, ~, ~)
secondpriority

function thirdpriority_Callback(~, ~, ~)
thirdpriority

function simpareto_Callback(~, ~, ~)
simparetoplot

function compair_Callback(~, ~, handles)
compairing

function pushbutton10_Callback(~, ~, ~)
fourthpriority

function chosepriority_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function chosepriority_Callback(hObject, ~, ~)
val = get(hObject, 'Value');
switch val
    case 2, run('firstpriority.m');
    case 3, run('secondpriority.m');
    case 4, run('thirdpriority.m');
    case 5, run('forthpriority.m');
end

function close_Callback(hObject, ~, ~)
delete(hObject)

function pushbutton12_Callback(~, ~, ~)
winopen('help.txt');
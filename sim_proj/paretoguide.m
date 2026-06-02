function varargout = paretoguide(varargin)
% PARETOGUIDE MATLAB code for paretoguide.fig
%      PARETOGUIDE, by itself, creates a new PARETOGUIDE or raises the existing
%      singleton*.
%
%      H = PARETOGUIDE returns the handle to a new PARETOGUIDE or the handle to
%      the existing singleton*.
%
%      PARETOGUIDE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARETOGUIDE.M with the given input arguments.
%
%      PARETOGUIDE('Property','Value',...) creates a new PARETOGUIDE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before paretoguide_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to paretoguide_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help paretoguide

% Last Modified by GUIDE v2.5 23-Jan-2024 14:24:57

% Begin initialization code - DO NOT EDIT
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
% End initialization code - DO NOT EDIT


% --- Executes just before paretoguide is made visible.
function paretoguide_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to paretoguide (see VARARGIN)

% Choose default command line output for paretoguide
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes paretoguide wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = paretoguide_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in parametersploting.
function parametersploting_Callback(~, ~, ~)
% hObject    handle to parametersploting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plotting

% --- Executes on button press in paretotable.
function paretotable_Callback(~, ~, ~)
% hObject    handle to paretotable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
paretotable

% --- Executes on button press in paretodiagram.
function paretodiagram_Callback(~, ~, ~)
% hObject    handle to paretodiagram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
paretoplot

% --- Executes on button press in firstpriority.
function firstpriority_Callback(~, ~, ~)
% hObject    handle to firstpriority (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
firstpriority

% --- Executes on button press in secondpriority.
function secondpriority_Callback(~, ~, ~)
% hObject    handle to secondpriority (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
secondpriority

% --- Executes on button press in thirdpriority.
function thirdpriority_Callback(~, ~, ~)
% hObject    handle to thirdpriority (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
thirdpriority

% --- Executes on button press in simpareto.
function simpareto_Callback(~, ~, ~)
% hObject    handle to simpareto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
simparetoplot

% --- Executes on button press in compair.
function compair_Callback(~, ~, handles)
% hObject    handle to compair (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
compairing


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(~, ~, ~)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fourthpriority


% --- Executes when pareto is resized.
function pareto_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to pareto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function chosepriority_CreateFcn(hObject, eventdata, handles)
% hObject    handle to chosepriority (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Save the handles structure to the guidata to make it accessible by other functions
guidata(hObject, handles); % Add this line to save handles structure

% --- Executes on selection change in chosepriority.
function chosepriority_Callback(hObject, eventdata, handles)
% hObject    handle to chosepriority (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the selected index and strings from the popupmenu
selectedIndex = get(hObject, 'Value');
popupmenuStrings = get(hObject, 'String');

% Check the selected index and perform the corresponding action
switch selectedIndex
    case 2
        % Execute firstpriority.m when the second option is selected
        run('firstpriority.m');
    case 3
        % Execute secondpriority.m when the third option is selected
        run('secondpriority.m');
    case 4
        % Execute thirdpriority.m when the fourth option is selected
        run('thirdpriority.m');
    case 5
        % Execute fourthpriority.m when the fifth option is selected
        run('forthpriority.m');
    otherwise
        % Add any other actions you want to perform for other cases
end




% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(hObject)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over chosepriority.
function chosepriority_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to chosepriority (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen('help.txt');
iconFile = 'OIF.ico';

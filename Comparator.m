function varargout = Comparator(varargin)
% COMPARATOR MATLAB code for Comparator.fig
%      COMPARATOR, by itself, creates a new COMPARATOR or raises the existing
%      singleton*.
%
%      H = COMPARATOR returns the handle to a new COMPARATOR or the handle to
%      the existing singleton*.
%
%      COMPARATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPARATOR.M with the given input arguments.
%
%      COMPARATOR('Property','Value',...) creates a new COMPARATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Comparator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Comparator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Comparator

% Last Modified by GUIDE v2.5 24-Mar-2017 00:48:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Comparator_OpeningFcn, ...
                   'gui_OutputFcn',  @Comparator_OutputFcn, ...
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


% --- Executes just before Comparator is made visible.
function Comparator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Comparator (see VARARGIN)

% Choose default command line output for Comparator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
a=imread('def');
axes(handles.axes1);
imshow(a);
axes(handles.axes2);
imshow(a);

% UIWAIT makes Comparator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Comparator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function org_Callback(hObject, eventdata, handles)
% hObject    handle to org (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of org as text
%        str2double(get(hObject,'String')) returns contents of org as a double


% --- Executes during object creation, after setting all properties.
function org_CreateFcn(hObject, eventdata, handles)
% hObject    handle to org (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ogBrowse.
function ogBrowse_Callback(hObject, eventdata, handles)
% hObject    handle to ogBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path,z]=uigetfile({'*.jpg;*.tif;*.png;*.gif;*.bmp','All Image Files';'*.*','All Files'},'Input Image');
if z~=0
    fullpath=strcat(path,file);
    set(handles.org,'string',fullpath);
    a=imread(fullpath);
    axes(handles.axes1);
    imshow(a);
end

function reconst_Callback(hObject, eventdata, handles)
% hObject    handle to reconst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of reconst as text
%        str2double(get(hObject,'String')) returns contents of reconst as a double


% --- Executes during object creation, after setting all properties.
function reconst_CreateFcn(hObject, eventdata, handles)
% hObject    handle to reconst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reBrowse.
function reBrowse_Callback(hObject, eventdata, handles)
% hObject    handle to reBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path,z]=uigetfile({'*.jpg;*.tif;*.png;*.gif;*.bmp','All Image Files';'*.*','All Files'},'Input Image');
if z~=0
    fullpath=strcat(path,file);
    set(handles.reconst,'string',fullpath);
    a=imread(fullpath);
    axes(handles.axes2);
    imshow(a);
end


% --- Executes on button press in compare.
function compare_Callback(hObject, eventdata, handles)
% hObject    handle to compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
or=get(handles.org,'string');
re=get(handles.reconst,'string');
if isempty(or)
    msgbox('Choose Orignal Image','Error','error');
    return;
elseif isempty(re)
    msgbox('Choose Reconstructed Image','Error','error');
    return;
end
org=imread(or);
rec=imread(re);
[x,y,z]=size(org);
rec=imresize(rec,[x,y]);
Q = 255;
MSE = sum(sum(sum((rec-org).^2)))/x /y /z;
PSNR=10*log10(Q*Q/MSE);
set(handles.mse,'string',num2str(MSE));
set(handles.psnr,'string',num2str(PSNR));


% --- Executes on button press in menu.
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();
Menu

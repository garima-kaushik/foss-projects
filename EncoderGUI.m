    function varargout = EncoderGUI(varargin)
% ENCODERGUI MATLAB code for EncoderGUI.fig
%      ENCODERGUI, by itself, creates a new ENCODERGUI or raises the existing
%      singleton*.
%
%      H = ENCODERGUI returns the handle to a new ENCODERGUI or the handle to
%      the existing singleton*.
%
%      ENCODERGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENCODERGUI.M with the given input arguments.
%
%      ENCODERGUI('Property','Value',...) creates a new ENCODERGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EncoderGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EncoderGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EncoderGUI

% Last Modified by GUIDE v2.5 31-Mar-2017 01:25:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EncoderGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @EncoderGUI_OutputFcn, ...
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


% --- Executes just before EncoderGUI is made visible.
function EncoderGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EncoderGUI (see VARARGIN)

% Choose default command line output for EncoderGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
EnableAll(handles)
a=imread('def');
axes(handles.axes1);
imshow(a);
axes(handles.axes2);
imshow(a);
progressBar = uiProgressBar(handles.uipanel2);
uiProgressBar(progressBar,0);
set(handles.load,'string','');


% UIWAIT makes EncoderGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EncoderGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function inImg_Callback(hObject, eventdata, handles)
% hObject    handle to inImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inImg as text
%        str2double(get(hObject,'String')) returns contents of inImg as a double


% --- Executes during object creation, after setting all properties.
function inImg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in nos.
function nos_Callback(hObject, eventdata, handles)
% hObject    handle to nos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns nos contents as cell array
%        contents{get(hObject,'Value')} returns selected item from nos


% --- Executes during object creation, after setting all properties.
function nos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function coverImg_Callback(hObject, eventdata, handles)
% hObject    handle to coverImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of coverImg as text
%        str2double(get(hObject,'String')) returns contents of coverImg as a double


% --- Executes during object creation, after setting all properties.
function coverImg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to coverImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function DisableAll(handles)
set(handles.inImg,'Enable','off');
set(handles.coverImg,'Enable','off');
set(handles.shareName,'Enable','off');
set(handles.inImg,'Enable','off');
set(handles.nos,'Enable','off');
set(handles.inImgBrowse,'Enable','off');
set(handles.coverImgBrowse,'Enable','off');
set(handles.sharebrowse,'Enable','off');
set(handles.encode,'Enable','off');
set(handles.menu,'Enable','off');

function EnableAll(handles)
set(handles.inImg,'Enable','on');
set(handles.coverImg,'Enable','on');
set(handles.shareName,'Enable','on');
set(handles.inImg,'Enable','on');
set(handles.nos,'Enable','on');
set(handles.inImgBrowse,'Enable','on');
set(handles.coverImgBrowse,'Enable','on');
set(handles.sharebrowse,'Enable','on');
set(handles.encode,'Enable','on');
set(handles.menu,'Enable','on');

% --- Executes on button press in encode.
function encode_Callback(hObject, eventdata, handles)
% hObject    handle to encode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
in=get(handles.inImg,'string');
cvr=get(handles.coverImg,'string');
nshare=get(handles.nos,'Value');
nshare=nshare+1;
share=get(handles.shareName,'string');
if isempty(in)
    msgbox('Choose Input Image','Error','error');
    return;
elseif isempty(cvr)
    msgbox('Choose Cover Image','Error','error');
    return;
elseif isempty(share)
    share='Share';
end
inImg=imread(in);
cvrImg=imread(cvr);
[iz]=size(inImg,3);
[cz]=size(cvrImg,3);
if iz~=cz
    msgbox(sprintf('Both Images should of same type \n i.e. Either Gray or Color image'),'Error','error');
    return;
end

DisableAll(handles);

progressBar = uiProgressBar(handles.uipanel2);
uiProgressBar(progressBar,0);
pause(.5);
set(handles.load,'string','');

if iz==3
    [rshareres]=main_encod(inImg(:,:,1),cvrImg(:,:,1),nshare,handles.load,progressBar,.3,0);
    set(handles.load,'string','30%....Red Layer Encoded');
    uiProgressBar(progressBar,.3);
    pause(.5);
    [gshareres]=main_encod(inImg(:,:,2),cvrImg(:,:,2),nshare,handles.load,progressBar,.3,.3);
    set(handles.load,'string','60%....Green Layer Encoded');
    uiProgressBar(progressBar,.6);
    pause(.5);
    [bshareres]=main_encod(inImg(:,:,3),cvrImg(:,:,3),nshare,handles.load,progressBar,.3,0.6);
    uiProgressBar(progressBar,.9);
    set(handles.load,'string','90%....Blue Layer Encoded.');
    pause(.5);
    set(handles.load,'string','90%....Image Encoded.Saving....');
    pause(.5);
    [x,y,z]=size(rshareres);
    shareres=uint8(zeros([x,y,3]));
    sharestr = cell(nshare, 1);
    for i=1:nshare
        shareres(:,:,1)=rshareres(:,:,i);
        shareres(:,:,2)=gshareres(:,:,i);
        shareres(:,:,3)=bshareres(:,:,i);
        sharestr{i} = strcat(share,num2str(i));
        sharestr{i} = strcat(sharestr{i},'.bmp');
%         imwrite(rshareres(:,:,1),'red1.bmp','bmp');
%         imwrite(gshareres(:,:,1),'green1.bmp','bmp');
%         imwrite(bshareres(:,:,1),'blue1.bmp','bmp');
        imwrite(shareres,sharestr{i},'bmp');
    end   
else
    shareres=main_encod(inImg,cvrImg,nshare,handles.load,progressBar,.95,0);
    %95
    set(handles.load,'string','95%....Image Encoded.Saving....');
    uiProgressBar(progressBar,.95);
    pause(.5)
    sharestr = cell(nshare, 1);
    for i=1:nshare
        sharestr{i} = strcat(share,num2str(i));
        sharestr{i} = strcat(sharestr{i},'.bmp');
        imwrite(shareres(:,:,i),sharestr{i},'bmp');
    end
end
set(handles.load,'string','100%....Encoding Completed')
uiProgressBar(progressBar,1.0);
EnableAll(handles)

% --- Executes on button press in menu.
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
close();
Menu;


% --- Executes on button press in inImgBrowse.
function inImgBrowse_Callback(hObject, eventdata, handles)
% hObject    handle to inImgBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path,z]=uigetfile({'*.jpg;*.tif;*.png;*.gif;*.bmp','All Image Files';'*.*','All Files'},'Input Image');
if z~=0
    fullpath=strcat(path,file);
    set(handles.inImg,'string',fullpath);
    a=imread(fullpath);
    axes(handles.axes1);
    imshow(a);
end


% --- Executes on button press in coverImgBrowse.
function coverImgBrowse_Callback(hObject, eventdata, handles)
% hObject    handle to coverImgBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path,z]=uigetfile({'*.jpg;*.tif;*.png;*.gif;*.bmp','All Image Files';'*.*','All Files'},'Cover Image');
if z~=0
    fullpath=strcat(path,file);
    set(handles.coverImg,'string',fullpath);
    a=imread(fullpath);
    axes(handles.axes2);
    imshow(a);
end


% --- Executes on key press with focus on coverImgBrowse and none of its controls.
function coverImgBrowse_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to coverImgBrowse (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function shareName_Callback(hObject, eventdata, handles)
% hObject    handle to shareName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of shareName as text
%        str2double(get(hObject,'String')) returns contents of shareName as a double


% --- Executes during object creation, after setting all properties.
function shareName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to shareName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in sharebrowse.
function sharebrowse_Callback(hObject, eventdata, handles)
% hObject    handle to sharebrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path,z]=uiputfile({'*.jpg;*.tif;*.png;*.gif;*.bmp','All Image Files';'*.*','All Files'},'Cover Image');
if z~=0
    fullpath=strcat(path,file);
    set(handles.shareName,'string',fullpath);
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();
EncoderGUI;

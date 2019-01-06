function varargout = DecoderGUI(varargin)
% DECODERGUI MATLAB code for DecoderGUI.fig
%      DECODERGUI, by itself, creates a new DECODERGUI or raises the existing
%      singleton*.
%
%      H = DECODERGUI returns the handle to a new DECODERGUI or the handle to
%      the existing singleton*.
%
%      DECODERGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DECODERGUI.M with the given input arguments.
%
%      DECODERGUI('Property','Value',...) creates a new DECODERGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DecoderGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DecoderGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DecoderGUI

% Last Modified by GUIDE v2.5 31-Mar-2017 01:21:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DecoderGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @DecoderGUI_OutputFcn, ...
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


% --- Executes just before DecoderGUI is made visible.
function DecoderGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DecoderGUI (see VARARGIN)

% Choose default command line output for DecoderGUI
handles.output = hObject;
handles.n=2;
handles.shares=[handles.share1,handles.share2,handles.share3,handles.share4,handles.share5];
handles.sharetxt=[handles.sharetxt1,handles.sharetxt2,handles.sharetxt3,handles.sharetxt4,handles.sharetxt5];
handles.sharebrowse=[handles.shareBrowse1,handles.shareBrowse2,handles.shareBrowse3,handles.shareBrowse4,handles.shareBrowse5];
% Update handles structure
a=imread('def');
imshow(a)
set(handles.axes1,'units','pixels','position',[100,412,1160,400]);
pause(.5);
for i=1:5
    set(handles.shares(i),'visible','off');
    set(handles.sharetxt(i),'visible','off');
    set(handles.sharebrowse(i),'visible','off');
end
for i=1:handles.n
    set(handles.shares(i),'visible','on');
    set(handles.sharetxt(i),'visible','on');
    set(handles.sharebrowse(i),'visible','on');
end
progressBar = uiProgressBar(handles.uipanel2);
uiProgressBar(progressBar,0);
set(handles.load,'string','');
guidata(hObject, handles);
guidata(hObject, handles);
% UIWAIT makes DecoderGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DecoderGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function share1_Callback(hObject, eventdata, handles)
% hObject    handle to share1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of share1 as text
%        str2double(get(hObject,'String')) returns contents of share1 as a double


% --- Executes during object creation, after setting all properties.
function share1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to share1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in shareBrowse1.
function shareBrowse1_Callback(hObject, eventdata, handles)
% hObject    handle to shareBrowse1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path,z]=uigetfile({'*.jpg;*.tif;*.png;*.gif;*.bmp','All Image Files';'*.*','All Files'},'Share 1');
if z~=0
    fullpath=strcat(path,file);
    set(handles.share1,'string',fullpath);
    a=imread(fullpath);
    try 
        axes(handles.axes1);
    catch    
        handles.axes1=gca;
    end
    x=subplot(1,handles.n,1,'align');
    p=get(x,'position');
    p=[p(1),p(2)+.2,p(3),p(4)];
    imshow(a);
    n=handles.n;
    set(x,'position',p);
    hold on;
end
guidata(hObject, handles);



% --- Executes on selection change in nos.
function nos_Callback(hObject, eventdata, handles)
% hObject    handle to nos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=get(handles.nos,'Value');
handles.n=n+1;
for i=1:5
    set(handles.shares(i),'visible','off');
    set(handles.sharetxt(i),'visible','off');
    set(handles.sharebrowse(i),'visible','off');
end
for i=1:handles.n
    set(handles.shares(i),'visible','on');
    set(handles.sharetxt(i),'visible','on');
    set(handles.sharebrowse(i),'visible','on');
end
guidata(hObject,handles);

% tec=[];
% edc=[];
% btc=[];
% clf(edc(:));
% clf(btc(:));
% clf(tec(:));
% 
% x=size(tec);
% 
% for i=1:n
%     tec=[tec,uicontrol(handles.uipanel1,'Style','text','FontSize',13.0,'String',strcat('Share',{' '},num2str(i+1)),'OuterPosition',[38,162-i*30,86 ,25])];
%     edc=[edc,uicontrol(handles.uipanel1,'Style','edit','String','','Tag',strcat('share',num2str(i+1)),'OuterPosition',[124,162-i*30,590 ,25])];
%     btc=[btc,uicontrol(handles.uipanel1,'Style','pushbutton','String','Browse','Tag',strcat('sharebrowse',num2str(i+1)),'OuterPosition',[713,162-i*30,87,25])];
% end
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


% --- Executes on key press with focus on nos and none of its controls.
function nos_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to nos (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
a=4



function share2_Callback(hObject, eventdata, handles)
% hObject    handle to share2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of share2 as text
%        str2double(get(hObject,'String')) returns contents of share2 as a double


% --- Executes during object creation, after setting all properties.
function share2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to share2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in shareBrowse2.
function shareBrowse2_Callback(hObject, eventdata, handles)
% hObject    handle to shareBrowse2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDfunction shareBrowse1_Callback(hObject, eventdata, handles)
% hObject    handle to shareBrowse1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path,z]=uigetfile({'*.jpg;*.tif;*.png;*.gif;*.bmp','All Image Files';'*.*','All Files'},'Share 2');
if z~=0
    fullpath=strcat(path,file);
    set(handles.share2,'string',fullpath);
    a=imread(fullpath);
    try 
        axes(handles.axes1);
    catch    
        handles.axes1=gca;
    end
    x=subplot(1,handles.n,2,'align');
    p=get(x,'position');
    p=[p(1),p(2)+.2,p(3),p(4)];
    set(x,'position',p);
    imshow(a);
    hold on;
end
guidata(hObject, handles);


function share3_Callback(hObject, eventdata, handles)
% hObject    handle to share3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of share3 as text
%        str2double(get(hObject,'String')) returns contents of share3 as a double


% --- Executes during object creation, after setting all properties.
function share3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to share3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in shareBrowse3.
function shareBrowse3_Callback(hObject, eventdata, handles)
% hObject    handle to shareBrowse3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.n < 3
    msgbox(strcat('Only',{' '},num2str(handles.n),' Shares allowed'),'Warning','error'); 
    return;
end
[file,path,z]=uigetfile({'*.jpg;*.tif;*.png;*.gif;*.bmp','All Image Files';'*.*','All Files'},'Share 3');
if z~=0
    fullpath=strcat(path,file);
    set(handles.share3,'string',fullpath);
    a=imread(fullpath);
    try 
        axes(handles.axes1);
    catch    
        handles.axes1=gca;
    end
    handle.axes1=gca;
    x=subplot(1,handles.n,3,'align');
    p=get(x,'position');
    p=[p(1),p(2)+.2,p(3),p(4)];
    set(x,'position',p);
    imshow(a);
    hold on;
end
guidata(hObject, handles);

function share4_Callback(hObject, eventdata, handles)
% hObject    handle to share4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of share4 as text
%        str2double(get(hObject,'String')) returns contents of share4 as a double


% --- Executes during object creation, after setting all properties.
function share4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to share4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in shareBrowse4.
function shareBrowse4_Callback(hObject, eventdata, handles)
% hObject    handle to shareBrowse4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.n < 4
    msgbox(strcat('Only',{' '},num2str(handles.n),' Shares allowed'),'Warning','error'); 
    return;
end
[file,path,z]=uigetfile({'*.jpg;*.tif;*.png;*.gif;*.bmp','All Image Files';'*.*','All Files'},'Share 4');
if z~=0
    fullpath=strcat(path,file);
    set(handles.share4,'string',fullpath);
    a=imread(fullpath);
    try 
        axes(handles.axes1);
    catch    
        handles.axes1=gca;
    end
    handles.axes1=gca;
    x=subplot(1,handles.n,4,'align');
    p=get(x,'position');
    p=[p(1),p(2)+.2,p(3),p(4)];
    set(x,'position',p);
    imshow(a);
    hold on;
end
guidata(hObject, handles);

function share5_Callback(hObject, eventdata, handles)
% hObject    handle to share5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of share5 as text
%        str2double(get(hObject,'String')) returns contents of share5 as a double


% --- Executes during object creation, after setting all properties.
function share5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to share5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in shareBrowse5.
function shareBrowse5_Callback(hObject, eventdata, handles)
% hObject    handle to shareBrowse5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.n < 5
    msgbox(strcat('Only',{' '},num2str(handles.n),' Shares allowed'),'Warning','error'); 
    return;
end
[file,path,z]=uigetfile({'*.jpg;*.tif;*.png;*.gif;*.bmp','All Image Files';'*.*','All Files'},'Share 5');
if z~=0
    fullpath=strcat(path,file);
    set(handles.share5,'string',fullpath);
    a=imread(fullpath);
    try 
        axes(handles.axes1);
    catch    
        handles.axes1=gca;
    end
    handles.axes1=gca;
    x=subplot(1,handles.n,5,'align');
    p=get(x,'position');
    p=[p(1),p(2)+.2,p(3),p(4)];
    set(x,'position',p);
    imshow(a);
    hold on;
end
guidata(hObject, handles);

% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function DisableAll(handles)
set(handles.nos,'Enable','off');
set(handles.share1,'Enable','off');
set(handles.share2,'Enable','off');
set(handles.share3,'Enable','off');
set(handles.share4,'Enable','off');
set(handles.share5,'Enable','off');
set(handles.out,'Enable','off');
set(handles.shareBrowse1,'Enable','off');
set(handles.shareBrowse2,'Enable','off');
set(handles.shareBrowse3,'Enable','off');
set(handles.shareBrowse4,'Enable','off');
set(handles.shareBrowse5,'Enable','off');
set(handles.decode,'Enable','off');
set(handles.menu,'Enable','off');

function EnableAll(handles)
set(handles.nos,'Enable','on');
set(handles.share1,'Enable','on');
set(handles.share2,'Enable','on');
set(handles.share3,'Enable','on');
set(handles.share4,'Enable','on');
set(handles.share5,'Enable','on');
set(handles.out,'Enable','on');
set(handles.shareBrowse1,'Enable','on');
set(handles.shareBrowse2,'Enable','on');
set(handles.shareBrowse3,'Enable','on');
set(handles.shareBrowse4,'Enable','on');
set(handles.shareBrowse5,'Enable','on');
set(handles.decode,'Enable','on');
set(handles.menu,'Enable','on');

% --- Executes on button press in decode.
function decode_Callback(hObject, eventdata, handles)
% hObject    handle to decode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
progressBar = uiProgressBar(handles.uipanel2);
uiProgressBar(progressBar,0);
pause(.5);
set(handles.load,'string','');
sharepath= cell(handles.n,1);
for i=1:handles.n
    tempPath=get(handles.shares(1,i),'String');
    if isempty(tempPath)
        msgbox(strcat('Choose Share',{' '},num2str(i),' Image'),'Error','error');
        return;
    end
    
    sharepath{i}=tempPath;
end

tempPath=get(handles.out,'String');
if isempty(tempPath)
    tempPath='Result';
end
set(handles.load,'string','0%....Verifing Shares');
uiProgressBar(progressBar,.0);
pause(.5);
[rshare,gshare,bshare,valid,colorFlag]=verify(sharepath,handles.n);
if valid==0
    msgbox('Invalid shares','Error','error');
    set(handles.load,'string','**** Invalid Shares****');
    uiProgressBar(progressBar,0);
    pause(.5);
    return;
end
DisableAll(handles);
set(handles.load,'string','2% Verified');
uiProgressBar(progressBar,.01);
pause(.5);
if colorFlag
    rout=main_decod(rshare,handles.load,progressBar,.3,.02);
    set(handles.load,'string','32%....Red layer extracted');
    uiProgressBar(progressBar,.32);
    pause(.5);
    gout=main_decod(gshare,handles.load,progressBar,.3,.32);
    set(handles.load,'string','62%....Green layer extracted');
    uiProgressBar(progressBar,.62);
    pause(.5);
    bout=main_decod(bshare,handles.load,progressBar,.3,.62);
    set(handles.load,'string','92%....Blue layer extracted');
    uiProgressBar(progressBar,.92);
    pause(.5);
    [x,y]=size(rout);
    out=zeros([x,y,3,]);
    out(:,:,1)=rout;
    out(:,:,2)=gout;
    out(:,:,3)=bout;
    set(handles.load,'string','99%....Shares Decoded.Saving');
    uiProgressBar(progressBar,.99);
    pause(.5);
    imwrite(uint8(out),strcat(tempPath,'.bmp'), 'bmp');
else
    out=main_decod(rshare,handles.load,progressBar,.97,.02);
    set(handles.load,'string','99%....Shares Decoded.Saving');
    uiProgressBar(progressBar,.99);
    pause(.5);
    imwrite(out, gray(256), strcat(tempPath,'.bmp'), 'bmp');
    
end
set(handles.load,'string','100%....Complete');
uiProgressBar(progressBar,1.0);
pause(.5);
axes(handles.axes1);
x=subplot(1,1,1);
p=get(x,'position');
p=[p(1),p(2)+.3,p(3)*.7,p(4)*.7];
set(x,'position',p);
imshow(uint8(out));
EnableAll(handles);



% --- Executes on button press in menu.
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();
Menu



function out_Callback(hObject, eventdata, handles)
% hObject    handle to out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of out as text
%        str2double(get(hObject,'String')) returns contents of out as a double


% --- Executes during object creation, after setting all properties.
function out_CreateFcn(hObject, eventdata, handles)
% hObject    handle to out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in outBrowse.
function outBrowse_Callback(hObject, eventdata, handles)
% hObject    handle to outBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path,z]=uiputfile({'*.jpg;*.tif;*.png;*.gif;*.bmp','All Image Files';'*.*','All Files'},'Cover Image');
if z~=0
    fullpath=strcat(path,file);
    set(handles.out,'string',fullpath);
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();
DecoderGUI;

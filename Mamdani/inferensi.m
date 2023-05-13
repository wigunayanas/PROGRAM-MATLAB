function varargout = inferensi(varargin)
% INFERENSI M-file for inferensi.fig
%      INFERENSI, by itself, creates a new INFERENSI or raises the existing
%      singleton*.
%
%      H = INFERENSI returns the handle to a new INFERENSI or the handle to
%      the existing singleton*.
%
%      INFERENSI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INFERENSI.M with the given input arguments.
%
%      INFERENSI('Property','Value',...) creates a new INFERENSI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before inferensi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to inferensi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help inferensi

% Last Modified by GUIDE v2.5 07-May-2023 14:13:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @inferensi_OpeningFcn, ...
                   'gui_OutputFcn',  @inferensi_OutputFcn, ...
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


% --- Executes just before inferensi is made visible.
function inferensi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to inferensi (see VARARGIN)

% Choose default command line output for inferensi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes inferensi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = inferensi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editpelayanan_Callback(hObject, eventdata, handles)
% hObject    handle to editpelayanan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editpelayanan as text
%        str2double(get(hObject,'String')) returns contents of editpelayanan as a double


% --- Executes during object creation, after setting all properties.
function editpelayanan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editpelayanan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editmakanan_Callback(hObject, eventdata, handles)
% hObject    handle to editmakanan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editmakanan as text
%        str2double(get(hObject,'String')) returns contents of editmakanan as a double


% --- Executes during object creation, after setting all properties.
function editmakanan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editmakanan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tombolkomposisi.
function tombolkomposisi_Callback(hObject, eventdata, handles)
% hObject    handle to tombolkomposisi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.evaluasi = get(handles.uitable2, 'Data');
x = 0:0.1:30;
p1 = handles.evaluasi(1,3); p2 = handles.evaluasi(2,3); p3 = handles.evaluasi(3,3);
mf1sdk = trimf(x,[0 5 10]); mf2sdg = trimf(x,[10 15 20]);
mf3bnk = trimf(x,[20 25 30]);
handles.mfhs = max(p1*mf1sdk,max(p2*mf2sdg,p3*mf3bnk));
set(handles.figure1,'CurrentAxes',handles.axes1);
plot(x,handles.mfhs,'LineWidth',2,'Color','black');
set(gca,'XLim',[0 30],'XTick',[0:5:80],'XColor','white');
set(gca,'YLim',[0 1],'YTick',[0 .25 0.5 0.75 1],'YGrid','on','YColor','white');


% --- Executes on button press in tomboldefuzyfikasi.
function tomboldefuzyfikasi_Callback(hObject, eventdata, handles)
% hObject    handle to tomboldefuzyfikasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.evaluasi=get(handles.uitable2,'Data');
x=0:0.1:30;
p1=handles.evaluasi(1,3);
p2=handles.evaluasi(2,3);
p3=handles.evaluasi(3,3);
mf1sdk=trimf(x,[0 5 10]);
mf2sdg=trimf(x,[10 15 20]);
mf3bnk=trimf(x,[20 25 30]);
handles.mfhs=max(p1*mf1sdk,max(p2*mf2sdg,p3*mf3bnk));
set(handles.figure1,'currentAxes',handles.axes1);
plot(x,handles.mfhs,'LineWidth',2,'Color','blue');
set(gca,'XLim',[0 30],'XTick',[0:5:80],'XColor','black');
set(gca,'YLim',[0 1],'YTick',[0 .25 .5 .75 1],'YGrid','on','YColor','black');
%
handles.pelayanan=str2num(get(handles.editpelayanan,'String'));
handles.makanan=str2num(get(handles.editmakanan,'String'));
HtngBonus=readfis('fisbonuswigunaB2.fis');
handles.crisp=evalfis([handles.pelayanan handles.makanan],HtngBonus);
set(handles.figure1,'Currentaxes',handles.axes3);
plot(x,handles.mfhs,'linewidth',2,'color','blue');
set(gca,'XLim',[0 30],'XTick',[handles.crisp],'XColor','black','Color','white');
garisCrisp=line([handles.crisp handles.crisp],[0 1],'LineWidth',2,'Color','red');
if handles.crisp <= 10
    set(handles.text28,'String','Bonus');
    set(handles.text29,'String','Sedikit');
end
if ((handles.crisp > 10) && (handles.crisp < 20))
    set(handles.text28,'String','Bonus');
    set(handles.text29,'String','Sedang');
end
if handles.crisp >= 20
    set(handles.text28,'String','Bonus');
    set(handles.text29,'String','Banyak');
end

% --- Executes on button press in tombolfuzyfikasi.
function tombolfuzyfikasi_Callback(hObject, eventdata, handles)
% hObject    handle to tombolfuzyfikasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pelayanan = str2num(get(handles.editpelayanan, 'String'));
makanan = str2num(get(handles.editmakanan, 'String'));
bacabonus = readfis('fisbonuswigunaB2.fis');

%pelayanan
mfpelayananparamkecewa = bacabonus.input(1).mf(1).params; %kecewa
mfpelayanantypekecewa = bacabonus.input(1).mf(1).type; %kecewa
derajatpelayanankecewa = evalmf(pelayanan, mfpelayananparamkecewa, mfpelayanantypekecewa);
set(handles.tekskecewa, 'String', num2str(derajatpelayanankecewa));

%pelayanan
mfpelayananparambagus = bacabonus.input(1).mf(1).params; %bagus
mfpelayanantypebagus = bacabonus.input(1).mf(1).type; %bagus
derajatpelayananbagus = evalmf(pelayanan, mfpelayananparambagus, mfpelayanantypebagus);
set(handles.teksbagus, 'String', num2str(derajatpelayananbagus));

%pelayanan
mfpelayananparampuas = bacabonus.input(1).mf(1).params; %puas
mfpelayanantypepuas = bacabonus.input(1).mf(1).type; %puas
derajatpelayananpuas = evalmf(pelayanan, mfpelayananparampuas, mfpelayanantypepuas);
set(handles.tekspuas, 'String', num2str(derajatpelayananpuas));

%makanan
mfmakananparamhambar = bacabonus.input(1).mf(1).params; %kecewa
mfmakanantypehambar = bacabonus.input(1).mf(1).type; %kecewa
derajatmakananhambar = evalmf(makanan, mfmakananparamhambar, mfmakanantypehambar);
set(handles.tekshambar, 'String', num2str(derajatmakananhambar));

%makanan
mfmakananparamenak = bacabonus.input(1).mf(1).params; %kecewa
mfmakanantypeenak = bacabonus.input(1).mf(1).type; %kecewa
derajatmakananenak = evalmf(makanan, mfmakananparamenak, mfmakanantypeenak);
set(handles.teksenak, 'String', num2str(derajatmakananenak));

%[R1] if pelayanan mengecewakan OR makanan hambar THEN bonus sedikit
handles.aturan(1,1) = derajatpelayanankecewa;
handles.aturan(1,2) = derajatmakananhambar;

%[R2] if pelayanan bagus THEN bonus sedang
handles.aturan(2,1) = derajatpelayananbagus;

%[R3] if pelayanan memuaskan OR makanan enak THEN bonus banyak
handles.aturan(3,1) = derajatpelayananpuas;
handles.aturan(3,2) = derajatmakananenak;

namakolom = {'Pelayanan','Makanan','Alfa-Predikat'} ;
set(handles.uitable2,'Data', handles.aturan, 'ColumnName', namakolom);


% --- Executes on button press in tombolevaluasi.
function tombolevaluasi_Callback(hObject, eventdata, handles)
% hObject    handle to tombolevaluasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.evaluasi = get(handles.uitable2, 'Data');
handles.evaluasi(1,3) = min(handles.evaluasi(1,1), handles.evaluasi(1,2));
handles.evaluasi(2,3) = min(handles.evaluasi(2,1));
handles.evaluasi(3,3) = min(handles.evaluasi(3,1), handles.evaluasi(3,2));
namakolom = {'Pelayanan','Makanan','Alfa-Predikat'} ;
set(handles.uitable2,'Data', handles.evaluasi, 'ColumnName', namakolom);


% --- Executes on button press in tombolreset.
function tombolreset_Callback(hObject, eventdata, handles)
% hObject    handle to tombolreset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.editpelayanan,'string','');
set(handles.editmakanan,'string','');
set(handles.tekskecewa,'string','');
set(handles.teksbagus,'string','');
set(handles.tekspuas,'string','');
set(handles.tekshambar,'string','');
set(handles.teksenak,'string','');
set(handles.text28,'String','-');
set(handles.text29,'String','-');
cla(handles.axes1,'reset');
cla(handles.axes3,'reset');
data=[;;;];
set(handles.uitable2,'Data',data);


% --- Executes on button press in tombolkeluar.
function tombolkeluar_Callback(hObject,  eventdata, handles)
% hObject    handle to tombolkeluar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(inferensi)

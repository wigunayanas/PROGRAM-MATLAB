function varargout = fuzzysugeno(varargin)
% FUZZYSUGENO M-file for fuzzysugeno.fig
%      FUZZYSUGENO, by itself, creates a new FUZZYSUGENO or raises the existing
%      singleton*.
%
%      H = FUZZYSUGENO returns the handle to a new FUZZYSUGENO or the handle to
%      the existing singleton*.
%
%      FUZZYSUGENO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FUZZYSUGENO.M with the given input arguments.
%
%      FUZZYSUGENO('Property','Value',...) creates a new FUZZYSUGENO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fuzzysugeno_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fuzzysugeno_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fuzzysugeno

% Last Modified by GUIDE v2.5 09-May-2023 08:46:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fuzzysugeno_OpeningFcn, ...
                   'gui_OutputFcn',  @fuzzysugeno_OutputFcn, ...
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


% --- Executes just before fuzzysugeno is made visible.
function fuzzysugeno_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fuzzysugeno (see VARARGIN)

% Choose default command line output for fuzzysugeno
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fuzzysugeno wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fuzzysugeno_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tombolfuzifikasi.
function tombolfuzifikasi_Callback(hObject, eventdata, handles)
% hObject    handle to tombolfuzifikasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pelayanan = str2num(get(handles.editpelayanan, 'String'));
makanan = str2num(get(handles.editmakanan, 'String'));
bacabonus = readfis('fissugeno_1115_WigunaYA_KlsBP.fis');

%pelayanan
mfpelayananparamkecewa = bacabonus.input(1).mf(1).params; %kecewa
mfpelayanantypekecewa = bacabonus.input(1).mf(1).type; %kecewa
derajatpelayanankecewa = evalmf(pelayanan, mfpelayananparamkecewa, mfpelayanantypekecewa);
set(handles.tekskecewa, 'String', num2str(derajatpelayanankecewa));

%pelayanan
mfpelayananparambagus = bacabonus.input(1).mf(2).params; %bagus
mfpelayanantypebagus = bacabonus.input(1).mf(2).type; %bagus
derajatpelayananbagus = evalmf(pelayanan, mfpelayananparambagus, mfpelayanantypebagus);
set(handles.teksbagus, 'String', num2str(derajatpelayananbagus));

%pelayanan
mfpelayananparampuas = bacabonus.input(1).mf(3).params; %puas
mfpelayanantypepuas = bacabonus.input(1).mf(3).type; %puas
derajatpelayananpuas = evalmf(pelayanan, mfpelayananparampuas, mfpelayanantypepuas);
set(handles.tekspuas, 'String', num2str(derajatpelayananpuas));

%makanan
mfmakananparamhambar = bacabonus.input(2).mf(1).params; %hambar
mfmakanantypehambar = bacabonus.input(2).mf(1).type; %hambar
derajatmakananhambar = evalmf(makanan, mfmakananparamhambar, mfmakanantypehambar);
set(handles.tekshambar, 'String', num2str(derajatmakananhambar));

%makanan
mfmakananparamenak = bacabonus.input(2).mf(2).params; %enak
mfmakanantypeenak = bacabonus.input(2).mf(2).type; %enak
derajatmakananenak = evalmf(makanan, mfmakananparamenak, mfmakanantypeenak);
set(handles.teksenak, 'String', num2str(derajatmakananenak));

%[R1] if pelayanan mengecewakan OR makanan hambar THEN bonus sedikit
handles.aturan(1,1) = derajatpelayanankecewa;
set(handles.figure1, 'CurrentAxes', handles.axes1);
%menghapus grafik pada AxES 1
x = 0; y = 0; plot(x,y);
set(gca,'XLim',[0 10], 'XTick',[0:2:10]);
set(gca,'YLim',[0 1], 'YTick',[0 .25 0.5 0.75 1]);
%menggambar mf pelayanan mengecewakan
x = 0:0.1:10;
hold on;
a1 = gaussmf(x,[1.699 0]);
plot(x,a1);plot(x,derajatpelayanankecewa,'LineWidth', 5,'Color','red');
set(gca,'YLim',[0 1], 'YTick',[derajatpelayanankecewa]); hold off;

handles.aturan(1,2) = derajatmakananhambar;
set(handles.figure1, 'CurrentAxes', handles.axes9);
%menghapus grafik pada AxES 9
x = 0; y = 0; plot(x,y);
set(gca,'XLim',[0 10], 'XTick',[0:2:10]);
set(gca,'YLim',[0 1], 'YTick',[0 .25 0.5 0.75 1]);
%menggambar mf makanan hambar
x = 0:0.1:10;
hold on;
a2 = trimf(x,[0 0 7]);
plot(x,a2);plot(x,derajatmakananhambar,'LineWidth', 5,'Color','red');
set(gca,'YLim',[0 1], 'YTick',[derajatmakananhambar]); hold off;

%[R2] if pelayanan bagus THEN bonus sedang
handles.aturan(2,1) = derajatpelayananbagus;
set(handles.figure1, 'CurrentAxes', handles.axes11);
%menghapus grafik pada AxES 11
x = 0; y = 0; plot(x,y);
set(gca,'XLim',[0 10], 'XTick',[0:2:10]);
set(gca,'YLim',[0 1], 'YTick',[0 .25 0.5 0.75 1]);
%menggambar mf pelayanan bagus
x = 0:0.1:10;
hold on;
a3 = gaussmf(x,[1.699 5]);
plot(x,a3);plot(x,derajatpelayananbagus,'LineWidth', 5,'Color','red');
set(gca,'YLim',[0 1], 'YTick',[derajatpelayananbagus]); hold off;


%[R3] if pelayanan memuaskan OR makanan enak THEN bonus banyak
handles.aturan(3,1) = derajatpelayananpuas;
set(handles.figure1, 'CurrentAxes', handles.axes13);
%menghapus grafik pada AxES 13
x = 0; y = 0; plot(x,y);
set(gca,'XLim',[0 10], 'XTick',[0:2:10]);
set(gca,'YLim',[0 1], 'YTick',[0 .25 0.5 0.75 1]);
%menggambar mf pelayanan puas
x = 0:0.1:10;
hold on;
a4 = gaussmf(x,[1.699 10]);
plot(x,a4);plot(x,derajatpelayananpuas,'LineWidth', 5,'Color','red');
set(gca,'YLim',[0 1], 'YTick',[derajatpelayananpuas]); hold off;

%makanan enak
handles.aturan(3,2) = derajatmakananenak;
set(handles.figure1, 'CurrentAxes', handles.axes14);
%menghapus grafik pada AxES 14
x = 0; y = 0; plot(x,y);
set(gca,'XLim',[0 10], 'XTick',[0:2:10]);
set(gca,'YLim',[0 1], 'YTick',[0 .25 0.5 0.75 1]);
%menggambar mf pelayanan puas
x = 0:0.1:10;
hold on;
a5 = trimf(x,[3 10 10]);
plot(x,a5);plot(x,derajatmakananenak,'LineWidth', 5,'Color','red');
set(gca,'YLim',[0 1], 'YTick',[derajatmakananenak]); hold off;


handles.aturan(1,3)=0;
handles.aturan(2,3)=0;
handles.aturan(3,3)=0;
namakolom = {'Pelayanan','Makanan','Alfa-Predikat'} ;
set(handles.uitable1,'Data', handles.aturan, 'ColumnName', namakolom);

% --- Executes on button press in tombolevaluasi.
function tombolevaluasi_Callback(hObject, eventdata, handles)
% hObject    handle to tombolevaluasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.evaluasi = get(handles.uitable1, 'Data');
handles.evaluasi(1,3)=max(handles.evaluasi(1,1), handles.evaluasi(1,2));
set(handles.figure1, 'CurrentAxes', handles.axes10);
%menghapus grafik pada AxES 10
x = 0; y = 0; plot(x,y);
set(gca,'XLim',[0 30], 'XTick',[0 5 15 25 30]);
set(gca,'YLim',[0 1], 'YTick',[0 .25 0.5 0.75 1]);
%menggambar mf bonus sedikit
x = 0:0.1:30;
hold on;
garissedikit = line([5 5],[0 handles.evaluasi(1,3)],'LineWidth',2,'Color','blue');
plot(x,handles.evaluasi(1,3),'LineWidth', 5,'Color','red');
set(gca,'YLim',[0 1], 'YTick',[handles.evaluasi(1,3)]); hold off;

%bonus sedang
handles.evaluasi(2,3)=max(handles.evaluasi(2,1));
set(handles.figure1, 'CurrentAxes', handles.axes12);
%menghapus grafik pada AxES 12
x = 0; y = 0; plot(x,y);
set(gca,'XLim',[0 30], 'XTick',[0 5 15 25 30]);
set(gca,'YLim',[0 1], 'YTick',[0 .25 0.5 0.75 1]);
%menggambar mf bonus sedang
x = 0:0.1:30;
hold on;
garissedang = line([15 15],[0 handles.evaluasi(2,3)],'LineWidth',2,'Color','blue');
plot(x,handles.evaluasi(2,3),'LineWidth', 5,'Color','red');
set(gca,'YLim',[0 1], 'YTick',[handles.evaluasi(2,3)]); hold off;

%bonus banyak
handles.evaluasi(3,3)=max(handles.evaluasi(3,1), handles.evaluasi(3,2));
set(handles.figure1, 'CurrentAxes', handles.axes15);
%menghapus grafik pada AxES 15
x = 0; y = 0; plot(x,y);
set(gca,'XLim',[0 30], 'XTick',[0 5 15 25 30]);
set(gca,'YLim',[0 1], 'YTick',[0 .25 0.5 0.75 1]);
%menggambar mf bonus banyak
x = 0:0.1:30;
hold on;
garisbanyak = line([25 25],[0 handles.evaluasi(3,3)],'LineWidth',2,'Color','blue');
plot(x,handles.evaluasi(3,3),'LineWidth', 5,'Color','red');
set(gca,'YLim',[0 1], 'YTick',[handles.evaluasi(3,3)]); hold off;
set(handles.uitable1,'Data',handles.evaluasi);

% --- Executes on button press in tombolkomposisi.
function tombolkomposisi_Callback(hObject, eventdata, handles)
% hObject    handle to tombolkomposisi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.evaluasi = get(handles.uitable1,'Data');
set(handles.figure1,'CurrentAxes',handles.axes17);
%menghapus grafik pada AxES 17
x = 0; y = 0; plot(x,y);
set(gca,'XLim',[0 30], 'XTick',[0:5:30]);
set(gca,'YLim',[0 1], 'YTick',[0 .25 0.5 0.75 1]);
%menghitung hasil komposisi
x = 0:0.1:30;
p1=handles.evaluasi(1,3); p2=handles.evaluasi(2,3); p3=handles.evaluasi(3,3);
mf1sdk = trimf(x,[5 5 5]); mf2sdg = trimf(x,[15 15 15]);
mf3bnk = trimf(x,[25 25 25]);
handles.mfhs1 = max(p1*mf1sdk,max(p2*mf2sdg,p3*mf3bnk));
set(handles.figure1,'CurrentAxes',handles.axes17); %axes17
plot(x,handles.mfhs1,'LineWidth',2,'Color','blue');
set(gca,'XLim',[0 30],'XTick',[0:5:30],'XColor','black');
set(gca,'YLim',[0 1],'YTick',[0 .25 0.5 0.75 1],'YGrid','off','YColor','black');



% --- Executes on button press in tomboldefuzifikasi.
function tomboldefuzifikasi_Callback(hObject, eventdata, handles)
% hObject    handle to tomboldefuzifikasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.evaluasi=get(handles.uitable1,'Data');
x=0:0.1:30;
p1=handles.evaluasi(1,3);
p2=handles.evaluasi(2,3);
p3=handles.evaluasi(3,3);
mf1sdk=trimf(x,[5 5 5]);
mf2sdg=trimf(x,[15 15 15]);
mf3bnk=trimf(x,[25 25 25]);
handles.mfhs1=max(p1*mf1sdk,max(p2*mf2sdg,p3*mf3bnk));
set(handles.figure1,'currentAxes',handles.axes16); %axes 16
plot(x,handles.mfhs1,'LineWidth',2,'Color','blue');
set(gca,'XLim',[0 30],'XTick',[0:5:30],'XColor','black');
set(gca,'YLim',[0 1],'YTick',[0 .25 .5 0.75 1],'YGrid','on','YColor','white');
%
handles.pelayanan=str2num(get(handles.editpelayanan,'String'));
handles.makanan=str2num(get(handles.editmakanan,'String'));
HtngBonus=readfis('fissugeno_1115_WigunaYA_KlsBP.fis');
handles.crisp=evalfis([handles.pelayanan handles.makanan],HtngBonus);
set(gca,'XLim',[0 30],'XTick',[handles.crisp],'XColor','black','Color','white');
set(gca,'YLim',[0 1],'YTick',[0 .25 .5 0.75 1],'YGrid','off','YColor','black');
garisCrisp=line([handles.crisp handles.crisp],[0 1],'LineWidth',2,'Color','black');
if handles.crisp <= 10
    set(handles.tekshasil,'String','Bonus Sedikit');
end
if ((handles.crisp > 10) && (handles.crisp < 20))
    set(handles.tekshasil,'String','Bonus Sedang');
end
if handles.crisp >= 20
    set(handles.tekshasil,'String','Bonus Banyak');
end

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
set(handles.tekshasil,'String','-');
cla(handles.axes1,'reset');
cla(handles.axes9,'reset');
cla(handles.axes10,'reset');
cla(handles.axes11,'reset');
cla(handles.axes12,'reset');
cla(handles.axes13,'reset');
cla(handles.axes14,'reset');
cla(handles.axes15,'reset');
cla(handles.axes16,'reset');
cla(handles.axes17,'reset');
data=[;;;];
set(handles.uitable1,'Data',data);

% --- Executes on button press in tombolkeluar.
function tombolkeluar_Callback(hObject, eventdata, handles)
% hObject    handle to tombolkeluar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(fuzzysugeno)


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

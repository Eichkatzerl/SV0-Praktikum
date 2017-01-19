function varargout = fourier_synthi(varargin)
% FOURIER_SYNTHI MATLAB code for fourier_synthi.fig
%      FOURIER_SYNTHI, by itself, creates a new FOURIER_SYNTHI or raises the existing
%      singleton*.
%
%      H = FOURIER_SYNTHI returns the handle to a new FOURIER_SYNTHI or the handle to
%      the existing singleton*.
%
%      FOURIER_SYNTHI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOURIER_SYNTHI.M with the given input arguments.
%
%      FOURIER_SYNTHI('Property','Value',...) creates a new FOURIER_SYNTHI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fourier_synthi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fourier_synthi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fourier_synthi

% Last Modified by GUIDE v2.5 07-Jan-2017 18:06:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fourier_synthi_OpeningFcn, ...
                   'gui_OutputFcn',  @fourier_synthi_OutputFcn, ...
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


% --- Executes just before fourier_synthi is made visible.
function fourier_synthi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fourier_synthi (see VARARGIN)

% Choose default command line output for fourier_synthi
handles.output = hObject;
set(handles.sa0, 'value', 0);
set(handles.sa1, 'value', 0);
set(handles.sa2, 'value', 0);
set(handles.sa3, 'value', 0);
set(handles.sa4, 'value', 0);
set(handles.sa5, 'value', 0);
set(handles.sb1, 'value', 0);
set(handles.sb2, 'value', 0);
set(handles.sb3, 'value', 0);
set(handles.sb4, 'value', 0);
set(handles.sb5, 'value', 0);
N = str2double(get(handles.number_of_Values,'String'));
a = [get(handles.sa0,'value') get(handles.sa1,'value') get(handles.sa2,'value') get(handles.sa3,'value') get(handles.sa4,'value') get(handles.sa5,'value')];
b = [0 get(handles.sb1,'value') get(handles.sb2,'value') get(handles.sb3,'value') get(handles.sb4,'value') get(handles.sb5,'value')];
y = fouriersynthese(N, a, b);
x = 1:N;
plot(x,y, 'b')

% Update handles structure
handles.prevValue = 1000;
guidata(hObject, handles);

% UIWAIT makes fourier_synthi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fourier_synthi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in reset_button.
function reset_button_Callback(hObject, eventdata, handles)
% hObject    handle to reset_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.sa0, 'value', 0);
set(handles.sa1, 'value', 0);
set(handles.sa2, 'value', 0);
set(handles.sa3, 'value', 0);
set(handles.sa4, 'value', 0);
set(handles.sa5, 'value', 0);
set(handles.sb1, 'value', 0);
set(handles.sb2, 'value', 0);
set(handles.sb3, 'value', 0);
set(handles.sb4, 'value', 0);
set(handles.sb5, 'value', 0);
N = str2double(get(handles.number_of_Values,'String'));
a = [get(handles.sa0,'value') get(handles.sa1,'value') get(handles.sa2,'value') get(handles.sa3,'value') get(handles.sa4,'value') get(handles.sa5,'value')];
b = [0 get(handles.sb1,'value') get(handles.sb2,'value') get(handles.sb3,'value') get(handles.sb4,'value') get(handles.sb5,'value')];
y = fouriersynthese(N, a, b);
x = 1:N;
plot(x,y, 'b')


function number_of_Values_Callback(hObject, eventdata, handles)
% hObject    handle to number_of_Values (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of number_of_Values as text
%        str2double(get(hObject,'String')) returns contents of number_of_Values as a double
N = str2double(get(handles.number_of_Values,'String'));
if (N > 10) && isnumeric(N)
    a = [get(handles.sa0,'value') get(handles.sa1,'value') get(handles.sa2,'value') get(handles.sa3,'value') get(handles.sa4,'value') get(handles.sa5,'value')];
    b = [0 get(handles.sb1,'value') get(handles.sb2,'value') get(handles.sb3,'value') get(handles.sb4,'value') get(handles.sb5,'value')];
    y = fouriersynthese(N, a, b);
    x = 1:N;
    plot(x,y, 'b')
    handles.prevValue = N;
    guidata(hObject, handles);
else
    set(handles.number_of_Values,'String', num2str(handles.prevValue))
    guidata(hObject, handles);
end


% --- Executes during object creation, after setting all properties.
function number_of_Values_CreateFcn(hObject, eventdata, handles)
% hObject    handle to number_of_Values (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sb1_Callback(hObject, eventdata, handles)
% hObject    handle to sb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
N = str2double(get(handles.number_of_Values,'String')); 
a = [get(handles.sa0,'value') get(handles.sa1,'value') get(handles.sa2,'value') get(handles.sa3,'value') get(handles.sa4,'value') get(handles.sa5,'value')];
b = [0 get(handles.sb1,'value') get(handles.sb2,'value') get(handles.sb3,'value') get(handles.sb4,'value') get(handles.sb5,'value')];
y = fouriersynthese(N, a, b);
x = 1:N;
plot(x,y, 'b')


% --- Executes during object creation, after setting all properties.
function sb1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sb2_Callback(hObject, eventdata, handles)
% hObject    handle to sb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
N = str2double(get(handles.number_of_Values,'String')); 
a = [get(handles.sa0,'value') get(handles.sa1,'value') get(handles.sa2,'value') get(handles.sa3,'value') get(handles.sa4,'value') get(handles.sa5,'value')];
b = [0 get(handles.sb1,'value') get(handles.sb2,'value') get(handles.sb3,'value') get(handles.sb4,'value') get(handles.sb5,'value')];
y = fouriersynthese(N, a, b);
x = 1:N;
plot(x,y, 'b')

% --- Executes during object creation, after setting all properties.
function sb2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sb3_Callback(hObject, eventdata, handles)
% hObject    handle to sb3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
N = str2double(get(handles.number_of_Values,'String')); 
a = [get(handles.sa0,'value') get(handles.sa1,'value') get(handles.sa2,'value') get(handles.sa3,'value') get(handles.sa4,'value') get(handles.sa5,'value')];
b = [0 get(handles.sb1,'value') get(handles.sb2,'value') get(handles.sb3,'value') get(handles.sb4,'value') get(handles.sb5,'value')];
y = fouriersynthese(N, a, b);
x = 1:N;
plot(x,y, 'b')

% --- Executes during object creation, after setting all properties.
function sb3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sb3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sb4_Callback(hObject, eventdata, handles)
% hObject    handle to sb4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
N = str2double(get(handles.number_of_Values,'String')); 
a = [get(handles.sa0,'value') get(handles.sa1,'value') get(handles.sa2,'value') get(handles.sa3,'value') get(handles.sa4,'value') get(handles.sa5,'value')];
b = [0 get(handles.sb1,'value') get(handles.sb2,'value') get(handles.sb3,'value') get(handles.sb4,'value') get(handles.sb5,'value')];
y = fouriersynthese(N, a, b);
x = 1:N;
plot(x,y, 'b')

% --- Executes during object creation, after setting all properties.
function sb4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sb4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sb5_Callback(hObject, eventdata, handles)
% hObject    handle to sb5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
N = str2double(get(handles.number_of_Values,'String')); 
a = [get(handles.sa0,'value') get(handles.sa1,'value') get(handles.sa2,'value') get(handles.sa3,'value') get(handles.sa4,'value') get(handles.sa5,'value')];
b = [0 get(handles.sb1,'value') get(handles.sb2,'value') get(handles.sb3,'value') get(handles.sb4,'value') get(handles.sb5,'value')];
y = fouriersynthese(N, a, b);
x = 1:N;
plot(x,y, 'b')

% --- Executes during object creation, after setting all properties.
function sb5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sb5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sa0_Callback(hObject, eventdata, handles)
% hObject    handle to sa0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
N = str2double(get(handles.number_of_Values,'String')); 
a = [get(handles.sa0,'value') get(handles.sa1,'value') get(handles.sa2,'value') get(handles.sa3,'value') get(handles.sa4,'value') get(handles.sa5,'value')];
b = [0 get(handles.sb1,'value') get(handles.sb2,'value') get(handles.sb3,'value') get(handles.sb4,'value') get(handles.sb5,'value')];
y = fouriersynthese(N, a, b);
x = 1:N;
plot(x,y, 'b')

% --- Executes during object creation, after setting all properties.
function sa0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sa0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sa1_Callback(hObject, eventdata, handles)
% hObject    handle to sa1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
N = str2double(get(handles.number_of_Values,'String')); 
a = [get(handles.sa0,'value') get(handles.sa1,'value') get(handles.sa2,'value') get(handles.sa3,'value') get(handles.sa4,'value') get(handles.sa5,'value')];
b = [0 get(handles.sb1,'value') get(handles.sb2,'value') get(handles.sb3,'value') get(handles.sb4,'value') get(handles.sb5,'value')];
y = fouriersynthese(N, a, b);
x = 1:N;
plot(x,y, 'b')

% --- Executes during object creation, after setting all properties.
function sa1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sa1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sa2_Callback(hObject, eventdata, handles)
% hObject    handle to sa2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
N = str2double(get(handles.number_of_Values,'String')); 
a = [get(handles.sa0,'value') get(handles.sa1,'value') get(handles.sa2,'value') get(handles.sa3,'value') get(handles.sa4,'value') get(handles.sa5,'value')];
b = [0 get(handles.sb1,'value') get(handles.sb2,'value') get(handles.sb3,'value') get(handles.sb4,'value') get(handles.sb5,'value')];
y = fouriersynthese(N, a, b);
x = 1:N;
plot(x,y, 'b')

% --- Executes during object creation, after setting all properties.
function sa2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sa2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sa3_Callback(hObject, eventdata, handles)
% hObject    handle to sa3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
N = str2double(get(handles.number_of_Values,'String')); 
a = [get(handles.sa0,'value') get(handles.sa1,'value') get(handles.sa2,'value') get(handles.sa3,'value') get(handles.sa4,'value') get(handles.sa5,'value')];
b = [0 get(handles.sb1,'value') get(handles.sb2,'value') get(handles.sb3,'value') get(handles.sb4,'value') get(handles.sb5,'value')];
y = fouriersynthese(N, a, b);
x = 1:N;
plot(x,y, 'b')

% --- Executes during object creation, after setting all properties.
function sa3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sa3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sa4_Callback(hObject, eventdata, handles)
% hObject    handle to sa4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
N = str2double(get(handles.number_of_Values,'String')); 
a = [get(handles.sa0,'value') get(handles.sa1,'value') get(handles.sa2,'value') get(handles.sa3,'value') get(handles.sa4,'value') get(handles.sa5,'value')];
b = [0 get(handles.sb1,'value') get(handles.sb2,'value') get(handles.sb3,'value') get(handles.sb4,'value') get(handles.sb5,'value')];
y = fouriersynthese(N, a, b);
x = 1:N;
plot(x,y, 'b')

% --- Executes during object creation, after setting all properties.
function sa4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sa4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sa5_Callback(hObject, eventdata, handles)
% hObject    handle to sa5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
N = str2double(get(handles.number_of_Values,'String')); 
a = [get(handles.sa0,'value') get(handles.sa1,'value') get(handles.sa2,'value') get(handles.sa3,'value') get(handles.sa4,'value') get(handles.sa5,'value')];
b = [0 get(handles.sb1,'value') get(handles.sb2,'value') get(handles.sb3,'value') get(handles.sb4,'value') get(handles.sb5,'value')];
y = fouriersynthese(N, a, b);
x = 1:N;
plot(x,y, 'b')

% --- Executes during object creation, after setting all properties.
function sa5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sa5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

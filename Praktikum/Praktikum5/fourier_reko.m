function varargout = fourier_reko(varargin)
% FOURIER_REKO MATLAB code for fourier_reko.fig
%      FOURIER_REKO, by itself, creates a new FOURIER_REKO or raises the existing
%      singleton*.
%
%      H = FOURIER_REKO returns the handle to a new FOURIER_REKO or the handle to
%      the existing singleton*.
%
%      FOURIER_REKO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOURIER_REKO.M with the given input arguments.
%
%      FOURIER_REKO('Property','Value',...) creates a new FOURIER_REKO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fourier_reko_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fourier_reko_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fourier_reko

% Last Modified by GUIDE v2.5 07-Jan-2017 21:53:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fourier_reko_OpeningFcn, ...
                   'gui_OutputFcn',  @fourier_reko_OutputFcn, ...
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


% --- Executes just before fourier_reko is made visible.
function fourier_reko_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fourier_reko (see VARARGIN)

% Choose default command line output for fourier_reko
handles.output = hObject;
cla;
set(handles.kslider,'value',10);
set(handles.kvalue,'string',num2str(10));
x = 1:1000;
[a,b] = fourieranalyse([zeros(1,250) ones(1,500) zeros(1,250)],get(handles.kslider,'value'));
y = fouriersynthese(1000,a,b);
y2 = [zeros(1,250) ones(1,500) zeros(1,250)];
hold on
plot(x,y,'b')
plot(x,y2,'r')
hold off 

% Update handles structure
handles.prevValue = 10;
guidata(hObject, handles);

% UIWAIT makes fourier_reko wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fourier_reko_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in funcselect.
function funcselect_Callback(hObject, eventdata, handles)
% hObject    handle to funcselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns funcselect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from funcselect
str = get(handles.funcselect,'String');
val = get(handles.funcselect,'value');
cla
switch str{val};
    case 'Rechteck'
        s = round(get(handles.kslider,'value'));
        x = 1:1000;
        [a,b] = fourieranalyse([zeros(1,250) ones(1,500) zeros(1,250)],s);
        y = fouriersynthese(1000,a,b);
        y2 = [zeros(1,250) ones(1,500) zeros(1,250)];
        hold on
        plot(x,y2,'r')
        plot(x,y,'b')
        hold off
    case 'Sägezahn'
        s = round(get(handles.kslider,'value'));
        x = 1:1000;
        [a,b] = fourieranalyse([zeros(1,250) 0:1/499:1 zeros(1,250)],s);
        y = fouriersynthese(1000,a,b);
        y2 = [zeros(1,250) 0:1/499:1 zeros(1,250)];
        hold on
        plot(x,y2,'r')
        plot(x,y,'b')
        hold off
    case 'Dreieck'
        s = round(get(handles.kslider,'value'));
        x = 1:1000;
        [a,b] = fourieranalyse([zeros(1,199) 0:1/300:1-1/300 1 1-1/300:-1/300:0 zeros(1,200)],s);
        y = fouriersynthese(1000,a,b);
        y2 = [zeros(1,199) 0:1/300:1-1/300 1 1-1/300:-1/300:0 zeros(1,200)];
        hold on
        plot(x,y2,'r')
        plot(x,y,'b')
        hold off
    case 'Einheitsimpuls'
        s = round(get(handles.kslider,'value'));
        x = 1:1000;
        [a,b] = fourieranalyse([zeros(1,499) 1 zeros(1,500)],s);
        y = fouriersynthese(1000,a,b);
        y2 = [zeros(1,499) 1 zeros(1,500)];
        hold on
        plot(x,y2,'r')
        plot(x,y,'b')
        hold off
end

% --- Executes during object creation, after setting all properties.
function funcselect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funcselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function kslider_Callback(hObject, eventdata, handles)
% hObject    handle to kslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

cla;
s = round(get(handles.kslider,'value'));
set(handles.kslider,'value',s);
set(handles.kvalue,'string',num2str(s));
handles.prevValue = s;
str = get(handles.funcselect,'String');
val = get(handles.funcselect,'value');
switch str{val};
    case 'Rechteck'
        s = round(get(handles.kslider,'value'));
        x = 1:1000;
        [a,b] = fourieranalyse([zeros(1,250) ones(1,500) zeros(1,250)],s);
        y = fouriersynthese(1000,a,b);
        y2 = [zeros(1,250) ones(1,500) zeros(1,250)];
        hold on
        plot(x,y2,'r')
        plot(x,y,'b')
        hold off
    case 'Sägezahn'
        s = round(get(handles.kslider,'value'));
        x = 1:1000;
        [a,b] = fourieranalyse([zeros(1,250) 0:1/499:1 zeros(1,250)],s);
        y = fouriersynthese(1000,a,b);
        y2 = [zeros(1,250) 0:1/499:1 zeros(1,250)];
        hold on
        plot(x,y2,'r')
        plot(x,y,'b')
        hold off
    case 'Dreieck'
        s = round(get(handles.kslider,'value'));
        x = 1:1000;
        [a,b] = fourieranalyse([zeros(1,199) 0:1/300:1-1/300 1 1-1/300:-1/300:0 zeros(1,200)],s);
        y = fouriersynthese(1000,a,b);
        y2 = [zeros(1,199) 0:1/300:1-1/300 1 1-1/300:-1/300:0 zeros(1,200)];
        hold on
        plot(x,y2,'r')
        plot(x,y,'b')
        hold off
    case 'Einheitsimpuls'
        s = round(get(handles.kslider,'value'));
        x = 1:1000;
        [a,b] = fourieranalyse([zeros(1,499) 1 zeros(1,500)],s);
        y = fouriersynthese(1000,a,b);
        y2 = [zeros(1,499) 1 zeros(1,500)];
        hold on
        plot(x,y2,'r')
        plot(x,y,'b')
        hold off
end



% --- Executes during object creation, after setting all properties.
function kslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function kvalue_Callback(hObject, eventdata, handles)
% hObject    handle to kvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kvalue as text
%        str2double(get(hObject,'String')) returns contents of kvalue as a double
K = str2double(get(handles.kvalue,'String'));
if K > 0 && K < 500 && isnumeric(K)
    str = get(handles.funcselect,'String');
    val = get(handles.funcselect,'value'); 
    cla;
    switch str{val};
        case 'Rechteck'
            x = 1:1000;
            [a,b] = fourieranalyse([zeros(1,250) ones(1,500) zeros(1,250)],K);
            y = fouriersynthese(1000,a,b);
            y2 = [zeros(1,250) ones(1,500) zeros(1,250)];
            hold on
            plot(x,y2,'r')
            plot(x,y,'b')
            hold off
            handles.prevValue = K;
            guidata(hObject, handles);
        case 'Sägezahn'
            x = 1:1000;
            [a,b] = fourieranalyse([zeros(1,250) 0:1/499:1 zeros(1,250)],K);
            y = fouriersynthese(1000,a,b);
            y2 = [zeros(1,250) 0:1/499:1 zeros(1,250)];
            hold on
            plot(x,y2,'r')
            plot(x,y,'b')
            hold off
            handles.prevValue = K;
            guidata(hObject, handles);
        case 'Dreieck'
            x = 1:1000;
            [a,b] = fourieranalyse([zeros(1,199) 0:1/300:1-1/300 1 1-1/300:-1/300:0 zeros(1,200)],K);
            y = fouriersynthese(1000,a,b);
            y2 = [zeros(1,199) 0:1/300:1-1/300 1 1-1/300:-1/300:0 zeros(1,200)];
            hold on
            plot(x,y2,'r')
            plot(x,y,'b')
            hold off
            handles.prevValue = K;
            guidata(hObject, handles);
        case 'Einheitsimpuls'
            x = 1:1000;
            [a,b] = fourieranalyse([zeros(1,499) 1 zeros(1,500)],K);
            y = fouriersynthese(1000,a,b);
            y2 = [zeros(1,499) 1 zeros(1,500)];
            hold on
            plot(x,y2,'r')
            plot(x,y,'b')
            hold off
            handles.prevValue = K;
            guidata(hObject, handles);
    end
    set(handles.kslider,'value',K);
else
    set(handles.kvalue,'String', num2str(handles.prevValue))
    guidata(hObject, handles);
end


% --- Executes during object creation, after setting all properties.
function kvalue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kvalue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

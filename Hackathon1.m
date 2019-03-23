function varargout = Hackathon1(varargin)
% HACKATHON1 MATLAB code for Hackathon1.fig
%      HACKATHON1, by itself, creates a new HACKATHON1 or raises the existing
%      singleton*.
%
%      H = HACKATHON1 returns the handle to a new HACKATHON1 or the handle to
%      the existing singleton*.
%
%      HACKATHON1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HACKATHON1.M with the given input arguments.
%
%      HACKATHON1('Property','Value',...) creates a new HACKATHON1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Hackathon1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Hackathon1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Hackathon1

% Last Modified by GUIDE v2.5 23-Mar-2019 04:34:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Hackathon1_OpeningFcn, ...
                   'gui_OutputFcn',  @Hackathon1_OutputFcn, ...
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


% --- Executes just before Hackathon1 is made visible.
function Hackathon1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Hackathon1 (see VARARGIN)

% Choose default command line output for Hackathon1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Hackathon1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Hackathon1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function citySize_Callback(hObject, eventdata, handles)
% hObject    handle to citySize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of citySize as text
%        str2double(get(hObject,'String')) returns contents of citySize as a double


% --- Executes during object creation, after setting all properties.
function citySize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to citySize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function totalPop_Callback(hObject, eventdata, handles)
% hObject    handle to totalPop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of totalPop as text
%        str2double(get(hObject,'String')) returns contents of totalPop as a double


% --- Executes during object creation, after setting all properties.
function totalPop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to totalPop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function depressionRate_Callback(hObject, eventdata, handles)
% hObject    handle to depressionRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of depressionRate as text
%        str2double(get(hObject,'String')) returns contents of depressionRate as a double


% --- Executes during object creation, after setting all properties.
function depressionRate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to depressionRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
N = str2num(get(handles.citySize,'String'));
A = zeros(N,N);
H = str2num(get(handles.totalPop,'String'));
S = round(H*str2double(get(handles.depressionRate,'String')));
iteration = 0;
for k=1:H
    i = randi([1,N]);
    j = randi([1,N]);
    while A(i,j) ~= 0
        i = randi([1,N]);
        j = randi([1,N]);
    end
    A(i,j) = 2;
    handles.City = imagesc(A);
    pause(0.01);
end
for k=1:S
    i = randi([1,N]);
    j = randi([1,N]);
    while A(i,j) ~= 0 
        i = randi([1,N]);
        j = randi([1,N]);
    end
    A(i,j) = 1;
    handles.City = imagesc(A);
    pause(0.01);
end
while S > 0
    for k = 1:N
        for l = 1:N
            if A(k,l) ~= 0
                if A(k,l) == 2
                    i = randi([-1,1]);
                    j = randi([-1,1]);
                    if k+i<1 || k+i>N
                        i = i*-1;
                    end
                    if l+j<1 || l+j>N
                        j = j*-1;
                    end
                    if A(k+i,l+j) ~= 0
                        if A(k+i,l+j) == 1
                            if randi([0,2]) == 2
                                A(k+i,l+j) = 2;
                                handles.City = imagesc(A);
                                pause(0.01);
                                S = S - 1;
                            end
                        end
                    end
                    if A(k+i,l+j) == 0
                        A(k+i,l+j) = 2;
                        A(k,l) = 0;
                        handles.City = imagesc(A);
                        pause(0.01);
                    end
                end
                if A(k,l) == 1
                    i = randi([-1,1]);
                    j = randi([-1,1]);
                    if k+i<1 || k+i>N
                        i = i*-1;
                    end
                    if l+j<1 || l+j>N
                        j = j*-1;
                    end
                    if A(k+i,l+j) ~= 0
                       if A(k+i,l+j) == 2
                          if randi([0,2]) == 2
                             A(k,l) = 2;
                             handles.City = imagesc(A);
                             pause(0.01);
                             S = S - 1;
                           end
                       end
                    end
                    if A(k+i,l+j) == 0
                      A(k+i,l+j) = 1;
                      A(k,l) = 0;
                      handles.City = imagesc(A);
                      pause(0.01);
                    end
                end
            end
        end
    end
    iteration = iteration + 1;
    set(handles.iter, 'String', num2str(iteration));
end

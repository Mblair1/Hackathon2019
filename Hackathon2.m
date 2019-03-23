function varargout = Hackathon2(varargin)
% HACKATHON2 MATLAB code for Hackathon2.fig
%      HACKATHON2, by itself, creates a new HACKATHON2 or raises the existing
%      singleton*.
%
%      H = HACKATHON2 returns the handle to a new HACKATHON2 or the handle to
%      the existing singleton*.
%
%      HACKATHON2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HACKATHON2.M with the given input arguments.
%
%      HACKATHON2('Property','Value',...) creates a new HACKATHON2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Hackathon2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Hackathon2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Hackathon2

% Last Modified by GUIDE v2.5 23-Mar-2019 04:48:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Hackathon2_OpeningFcn, ...
                   'gui_OutputFcn',  @Hackathon2_OutputFcn, ...
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


% --- Executes just before Hackathon2 is made visible.
function Hackathon2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Hackathon2 (see VARARGIN)

% Choose default command line output for Hackathon2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Hackathon2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Hackathon2_OutputFcn(hObject, eventdata, handles) 
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
N = str2double(get(handles.citySize,'String'));
B = zeros(N,N);
H = str2double(get(handles.totalPop,'String'));
S = round(H*str2double(get(handles.depressionRate,'String')));
H2 = round(H/7);
S2 = round(S/3);
N1 = round(N*.35);
N2 = round(N-N*.35);
iteration = 0;

for k=1:H2
    i = randi([N1,N2]);
    j = randi([N1,N2]);
    while B(i,j) ~= 0
        i = randi([N1,N2]);
        j = randi([N1,N2]);
    end
    B(i,j) = 2;
    handles.smallerArea = imagesc(B);
    pause(0.1);
end
for k=1:S2
    i = randi([N1,N2]);
    j = randi([N1,N2]);
    while B(i,j) ~= 0 
        i = randi([N1,N2]);
        j = randi([N1,N2]);
    end
    B(i,j) = 1;
    handles.smallerArea = imagesc(B);
    pause(0.1);
end
while S2 > 0
    for k = N1:N2
        for l = N1:N2
            if B(k,l) ~= 0
                if B(k,l) == 2
                    i = randi([-1,1]);
                    j = randi([-1,1]);
                    if k+i<N1 || k+i>N2
                        i = i*-1;
                    end
                    if l+j<N1 || l+j>N2
                        j = j*-1;
                    end
                    if B(k+i,l+j) ~= 0
                        if B(k+i,l+j) == 1
                            if randi([0,2]) == 2
                                B(k+i,l+j) = 2;
                                handles.smallerArea = imagesc(B);
                                pause(0.1);
                                S2 = S2 - 1;
                            end
                        end
                    end
                    if B(k+i,l+j) == 0
                        B(k+i,l+j) = 2;
                        B(k,l) = 0;
                        handles.smallerArea = imagesc(B);
                        pause(0.1);
                    end
                end
                if B(k,l) == 1
                    i = randi([-1,1]);
                    j = randi([-1,1]);
                    if k+i<N1 || k+i>N2
                        i = i*-1;
                    end
                    if l+j<N1 || l+j>N2
                        j = j*-1;
                    end
                    if B(k+i,l+j) ~= 0
                       if B(k+i,l+j) == 2
                          if randi([0,2]) == 2
                             B(k,l) = 2;
                             handles.smallerArea = imagesc(B);
                             pause(0.1);
                             S2 = S2 - 1;
                           end
                       end
                    end
                    if B(k+i,l+j) == 0
                      B(k+i,l+j) = 1;
                      B(k,l) = 0;
                      handles.smallerArea = imagesc(B);
                      pause(0.1);
                    end
                end
            end
        end
    end
    iteration = iteration + 1;
    set(handles.iter, 'String', num2str(iteration));
end


% --- Executes during object creation, after setting all properties.
function iter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

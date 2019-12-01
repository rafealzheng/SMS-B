function varargout = SMS(varargin)
% SMS MATLAB code for SMS.fig
%      SMS, by itself, creates a new SMS or raises the existing
%      singleton*.
%
%      H = SMS returns the handle to a new SMS or the handle to
%      the existing singleton*.
%
%      SMS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SMS.M with the given input arguments.
%
%      SMS('Property','Value',...) creates a new SMS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SMS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SMS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SMS

% Last Modified by GUIDE v2.5 20-Aug-2017 21:12:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SMS_OpeningFcn, ...
                   'gui_OutputFcn',  @SMS_OutputFcn, ...
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


% --- Executes just before SMS is made visible.
function SMS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SMS (see VARARGIN)

% Choose default command line output for SMS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SMS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SMS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
t=timer('Name','CircleTimer',...
'TimerFcn',@CircleTask,...
'Period',60,...
'ExecutionMode','fixedspacing');
t.UserData=3;
start(t); 


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

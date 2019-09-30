function varargout = Main(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_OutputFcn, ...
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

function Main_OpeningFcn(hObject, eventdata, handles, varargin)

global highscore;
global gamestate;
global score;

[highscore] = highscoreloader();

rng('shuffle')

gamestateinitial = zeros(4);
score = 0;

gamestate = gamestateinitial;

for x = 1:2
    gamestate = randomplacementtwo(gamestate);
end

set(handles.gamestate,'String', 'Welcome!');
[handles, hObject] = updatenumber(gamestate, handles, hObject);

handles.output = hObject;

guidata(hObject, handles);

function varargout = Main_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function SlideUp_Callback(hObject, eventdata, handles)
global highscore;
global gamestate;
global score;

[gamestate,update,score] = slideup(gamestate,score);

if update == 1
    gamestate = randomplacementtwofour(gamestate);
end

[handles, hObject, highscore] = scoreupdater( score, highscore, handles, hObject);
[handles, hObject, gameover] = checkloss(gamestate, score, handles, hObject);
[handles, hObject] = updatenumber(gamestate, handles, hObject);

handles.output = hObject;

guidata(hObject, handles);

function SlideLeft_Callback(hObject, eventdata, handles)
global highscore;
global gamestate;
global score;

gamestaterotate = rot90(gamestate,-1);
[gamestaterotate,update,score] = slideup(gamestaterotate,score);
gamestate = rot90(gamestaterotate,1);

if update == 1
    gamestate = randomplacementtwofour(gamestate);
end

[handles, hObject, highscore] = scoreupdater( score, highscore, handles, hObject);
[handles, hObject, gameover] = checkloss(gamestate, score, handles, hObject);
[handles, hObject] = updatenumber(gamestate, handles, hObject);

handles.output = hObject;

guidata(hObject, handles);

function SlideDown_Callback(hObject, eventdata, handles)
global highscore;
global gamestate;
global score;

gamestaterotate = flip(gamestate);
[gamestaterotate,update,score] = slideup(gamestaterotate,score);
gamestate = flip(gamestaterotate);

if update == 1
    gamestate = randomplacementtwofour(gamestate);
end

[handles, hObject, highscore] = scoreupdater( score, highscore, handles, hObject);
[handles, hObject, gameover] = checkloss(gamestate, score, handles, hObject);
[handles, hObject] = updatenumber(gamestate, handles, hObject);

handles.output = hObject;

guidata(hObject, handles);

function SlideRight_Callback(hObject, eventdata, handles)
global highscore;
global gamestate;
global score;

gamestaterotate = rot90(gamestate,1);
[gamestaterotate,update,score] = slideup(gamestaterotate,score);
gamestate = rot90(gamestaterotate,-1);

if update == 1
    gamestate = randomplacementtwofour(gamestate);
end

[handles, hObject, highscore] = scoreupdater( score, highscore, handles, hObject);
[handles, hObject, gameover] = checkloss(gamestate, score, handles, hObject);
[handles, hObject] = updatenumber(gamestate, handles, hObject);

handles.output = hObject;

guidata(hObject, handles);

function restart_Callback(hObject, eventdata, handles)
global highscore;
global gamestate;
global score;
rng('shuffle')

gamestateinitial = zeros(4);
score = 0;

gamestate = gamestateinitial;

for x = 1:2
    gamestate = randomplacementtwo(gamestate);
end

set(handles.gamestate,'String', 'New Game!');
[handles, hObject, highscore] = scoreupdater( score, highscore, handles, hObject);
[handles, hObject] = updatenumber(gamestate, handles, hObject);

handles.output = hObject;

guidata(hObject, handles);

function figure1_KeyPressFcn(hObject, eventdata, handles)

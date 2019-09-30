function [handles, hObject, gameover] = checkloss(gamestate, score, handles, hObject)

[gamestatetrash,update,score] = slideup(gamestate,score);

gamestaterotate = rot90(gamestate,-1);
[gamestatetrash,update2,score] = slideup(gamestaterotate,score);

gamestaterotate = flip(gamestate);
[gamestatetrash,update3,score] = slideup(gamestaterotate,score);

gamestaterotate = rot90(gamestate,1);
[gamestatetrash,update4,score] = slideup(gamestaterotate,score);

if update + update2 + update3 + update4 == 0
    gameover = 1;
    set(handles.gamestate,'String', 'Game Over! Restart!');
else
    gameover = 0;
    set(handles.gamestate,'String', 'Keep Playing!');
end

end
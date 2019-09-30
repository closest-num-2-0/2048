function [handles, hObject, highscore] = scoreupdater( score, highscore, handles, hObject)

if score > highscore
    highscore = score;
    save highscore.mat highscore
end

str1 = "Score";
str2 = num2str(score);
str3 = "Highscore";
str4 = num2str(highscore);

totalstr = str1 + "\n" + str2 + "\n" + str3 + "\n" + str4;

totalstr = compose(totalstr);

set(handles.scorevals,'String', totalstr);

end
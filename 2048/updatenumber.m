function [handles, hObject] = updatenumber(gamestate, handles, hObject)

for i = 1:16
    
    handlename = sprintf('number%d', i);
    
    switch gamestate(i)
        case 0
            color = [204,192,178];
        case 2
            color = [251,248,239];
        case 4
            color = [236,223,199];
        case 8
            color = [243,177,120];
        case 16
            color = [243,148,99];
        case 32
            color = [246,124,94];
        case 64
            color = [246,93,58];
        case 128
            color = [236,206,115];
        case 256
            color = [236,202,97];
        case 512
            color = [235,199,79];
        case 1024
            color = [237,196,64];
        case 2048
            color = [237,193,45];
        case 4096
            color = [255,61,59];
        case 8192
            color = [255,30,31];
        case 16384
            color = [255,30,30];
        case 32768
            color = [255,30,30];
        case 65536
            color = [255,30,30];
        case 131072
            color = [255,30,30];
    end
    
    colorval = (color+1)/256;
    set(handles.(handlename),'BackgroundColor', colorval);
    
    if gamestate(i) == 0
        set(handles.(handlename),'String', '');
    else
        str = num2str(gamestate(i));
        totalstr = "\n" + str;
        totalstr = compose (totalstr);
        set(handles.(handlename), 'String', totalstr);
    end
end

end
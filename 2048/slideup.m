function [gamestate,update,score] = slideup(gamestate,score)

beforemove = gamestate;

for x = 1:3
    for topval = [1,5,9,13]
        for shift = 0:2
            position = topval + shift;
            clearpos = topval+shift+1;
            if  gamestate(position) == 0
                gamestate(position) = gamestate(clearpos);
                gamestate(clearpos) =  0;
            end
        end
    end
end

for topval = [1,5,9,13]
    for shift = 0:2
        position = topval + shift;
        clearpos = topval+shift+1;
        if  gamestate(position) == gamestate(clearpos)
            gamestate(position) = gamestate(position)*2;
            score = score + gamestate(position)*2;
            gamestate(clearpos) =  0;
        end
    end
end

for x = 1:3
    for topval = [1,5,9,13]
        for shift = 0:2
            position = topval + shift;
            clearpos = topval+shift+1;
            if  gamestate(position) == 0
                gamestate(position) = gamestate(clearpos);
                gamestate(clearpos) =  0;
            end
        end
    end
end

if beforemove == gamestate
    update = 0;
else
    update = 1;
end

end
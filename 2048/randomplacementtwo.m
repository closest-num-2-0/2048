function [gamestate] = randomplacementtwo(gamestate)

position = randi([1,16]);

while gamestate(position) ~= 0
        position = randi([1,16]);
end

gamestate(position) = 2;

end


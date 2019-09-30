function [gamestate] = randomplacementtwofour(gamestate)

position = randi([1,16]);

while gamestate(position) ~= 0
    
        position = randi([1,16]);
        
end

value = randi([1,10]);
if value ~= 4
    value = 2;
end

gamestate(position) = value;

end
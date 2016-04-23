function [instructions] = directions(initials, instructions)
%
for I = 1:length(instructions)
    if(instructions(I).i_target == initials(I).i_initial)
        if(instructions(I).j_target == initials(I).j_initial)
            instructions(I).direction = '.';
        elseif(instructions(I).j_target > initials(I).j_initial)
            instructions(I).direction = 'N';
        else
            instructions(I).direction = 'S';
        end
    elseif(instructions(I).i_target > initials(I).i_initial)
        if(instructions(I).j_target == initials(I).j_initial)
            instructions(I).direction = 'E';
        elseif(instructions(I).j_target > initials(I).j_initial)
            instructions(I).direction = 'EN';
        else
            instructions(I).direction = 'ES';
        end
    else
        if(instructions(I).j_target == initials(I).j_initial)
            instructions(I).direction = 'W';
        elseif(instructions(I).j_target > initials(I).j_initial)
            instructions(I).direction = 'WN';
        else
            instructions(I).direction = 'WS';
        end
    end
end
end
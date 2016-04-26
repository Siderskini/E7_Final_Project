function [instructions] = wait_times(instructions, initials, max_beats)
%
for I = 1:length(instructions)
    distance = abs(instructions(I).i_target - initials(I).i_initial) + abs(instructions(I).j_target - initials(I).j_initial);
    instructions(I).wait = max_beats - abs(distance*2);
end

end
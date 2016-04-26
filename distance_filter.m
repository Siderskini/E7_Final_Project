function [instructions_list] = distance_filter(instructions_list, initials, max_beats)
%
steps = max_beats/2;
X = length(instructions_list);
I = 1;
for N = 1:X
    while(I <= X)
        flag = true;
        for J = 1:length(instructions_list(I).instr)
            distance = (instructions_list(I).instr(J).i_target-initials(J).i_initial)+(instructions_list(I).instr(J).j_target-initials(J).j_initial);
            if(abs(distance) > steps)
                flag = false;
            end
        end
        if flag == false
            instructions_list(I) = [];
            X = X - 1;
            I = I - 1;
        end
        I = I + 1;
    end
end
end
function [instructions_list] = direction_plus(instructions_list)
%
len1 = length(instructions_list);
len2 = length(instructions_list(1).instr);
for N = 1:len1
    temp_instr = instructions_list(N).instr;
    for I = 1:len2
        temp_dir = temp_instr(I).direction;
        switch temp_dir
            case 'NW'
                temp = struct('instr',[]);
                temp(1).instr = temp_instr;
                temp(1).instr(I).direction = 'WN';
                instructions_list = [instructions_list,temp];
            case 'NE'
                temp = struct('instr',[]);
                temp(1).instr = temp_instr;
                temp(1).instr(I).direction = 'EN';
                instructions_list = [instructions_list,temp];
            case 'SW'
                temp = struct('instr',[]);
                temp(1).instr = temp_instr;
                temp(1).instr(I).direction = 'WS';
                instructions_list = [instructions_list,temp];
            case 'SE'
                temp = struct('instr',[]);
                temp(1).instr = temp_instr;
                temp(1).instr(I).direction = 'ES';
                instructions_list = [instructions_list,temp];
            otherwise
        end
    end
end
end
function [final_instructions] = picker(instructions_list, max_beats, initials)
%
if(isempty(instructions_list))
    fprintf('\nBecause of this, the program will terminate.');
    final_instructions = 'Sorry.';
else
    positions = struct('x',[],'y',[]);
    temp = instructions_list(2).instr;
    count = 0;
    X = length(instructions_list(1).instr);
    Y = length(initials);
    for A = 1:Y
        positions(Y).x = initials(Y).i_initial;
        positions(Y).y = initials(Y).j_initial;
    end
    for I = 1:length(instructions_list)
        for B = 1:max_beats
            for J = 1:X
                test = positions;
                switch instructions_list(I).instr(J).direction
                    case '.'
                    case 'N'
                        if instructions_list(I).instr(J).j_target > test(J).y
                            test(J).y = test(J).y + 1;
                        end
                    case 'S'
                        if instructions_list(I).instr(J).j_target < test(J).y
                            test(J).y = test(J).y - 1;
                        end
                    case 'E'
                        if instructions_list(I).instr(J).i_target > test(J).x
                            test(J).x = test(J).x + 1;
                        end
                    case 'W'
                        if instructions_list(I).instr(J).i_target < test(J).x
                            test(J).x = test(J).x - 1;
                        end
                    case 'NE'
                        if instructions_list(I).instr(J).j_target > test(J).y
                            test(J).y = test(J).y + 1;
                        elseif instructions_list(I).instr(J).i_target > test(J).x
                            test(J).x = test(J).x + 1;
                        end
                    case 'EN'
                        if instructions_list(I).instr(J).i_target > test(J).x
                            test(J).x = test(J).x + 1;
                        elseif instructions_list(I).instr(J).j_target > test(J).y
                            test(J).y = test(J).y + 1;
                        end
                    case 'NW'
                        if instructions_list(I).instr(J).j_target > test(J).y
                            test(J).y = test(J).y + 1;
                        elseif instructions_list(I).instr(J).i_target < test(J).x
                            test(J).x = test(J).x - 1;
                        end
                    case 'WN'
                        if instructions_list(I).instr(J).i_target < test(J).x
                            test(J).x = test(J).x - 1;
                        elseif instructions_list(I).instr(J).j_target > test(J).y
                            test(J).y = test(J).y + 1;
                        end
                    case 'SE'
                        if instructions_list(I).instr(J).j_target < test(J).y
                            test(J).y = test(J).y - 1;
                        elseif instructions_list(I).instr(J).i_target > test(J).x
                            test(J).x = test(J).x + 1;
                        end
                    case 'ES'
                        if instructions_list(I).instr(J).i_target > test(J).x
                            test(J).x = test(J).x + 1;
                        elseif instructions_list(I).instr(J).j_target < test(J).y
                            test(J).y = test(J).y - 1;
                        end
                    case 'SW'
                        if instructions_list(I).instr(J).j_target < test(J).y
                            test(J).y = test(J).y - 1;
                        elseif instructions_list(I).instr(J).i_target < test(J).x
                            test(J).x = test(J).x - 1;
                        end
                    case 'WS'
                        if instructions_list(I).instr(J).i_target < test(J).x
                            test(J).x = test(J).x - 1;
                        elseif instructions_list(I).instr(J).j_target < test(J).y
                            test(J).y = test(J).y - 1;
                        end
                    otherwise
                end 
            end
            for C = 1:X
                
            end
        end
        final_instructions = temp;
    end
end
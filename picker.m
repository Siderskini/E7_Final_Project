function [final_instructions] = picker(instructions_list, max_beats, initials)
%
if(isempty(instructions_list))
    fprintf('\nBecause of this, the program will terminate.');
    final_instructions = 'Sorry.';
else
    positions = struct('x',[],'y',[]);
    temp = instructions_list(1).instr;
    best_count = 10000000000;
    X = length(instructions_list(1).instr);
    Z = X;
    Y = length(initials);
    for A = 1:Y
        positions(A).x = initials(A).i_initial;
        positions(A).y = initials(A).j_initial;
    end
    for I = 1:length(instructions_list)
        count = 0;
        test = positions;
        for B = 1:max_beats
            for J = 1:X
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
            rem = struct('strx',[],'stry',[]);
            for C = 1:Z
                rem(C).strx = int2str(test(C).x);
                rem(C).stry = int2str(test(C).y);
            end
            xi = {rem.strx};
            yi = {rem.stry};
            c = cellfun(@(f,g) [f g],xi', yi','un',0);
            [ii, ii] = unique(c,'stable');
            rem2 = rem(ii);
            count = count + (length(rem) - length(rem2));
        end
        if(count<best_count)
            temp = instructions_list(I).instr;
            best_count = count;
        end
        best_count
    end
    best_count
    final_instructions = temp;
end
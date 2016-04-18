%{
Okay so the point of this file is so we can test out our code with
arbitrary inputs without havign to call the entire function over and over
again. Just add your new target formation and initial formation in lines 11
and 12 and type 'test' into the editor. Also, it saves time in making your
test results every time you open matlab, as every time you open matlab,
your workspace is cleared. If this file becomes obsolete, we'll just get
rid of it. I just thought it held some time and effort benefits.
%}

target_formation = medium_e7_to_happy_target;
initial_formation = medium_e7_to_happy_initial;

% Finds the number of bandmembers by adding up all the 1s in the target
n_bandmembers = sum(sum(target_formation));

% Makes a structure with the appropriate fields (without any actual data)
% and copies it nb times to get a 1 x nb array of structs
instructions = struct('i_target',[],'j_target',[],'wait',[],'direction',[]);
instructions = repmat(instructions,1,n_bandmembers);

% This code finds the i and j indices of each target location and stores
% them in i and j, respectively (note that i and j are not used as of yet!)
[i,j] = find(target_formation);

% Now it is up to you to figure out how to use the information provided
% to fill out the instructions struct array with appropriate values!

% Configures the target position data in instructions struct;
for I = 1:length(instructions)
    instructions(I).i_target = i(I);
    instructions(I).j_target = j(I);
    instructions(I).wait = 0;
end

% initials now contains the intial locations of the band members;
for I = 1:length(instructions)
    [i,j] = find(initial_formation == I);
    initials(I).i_initial = i;
    initials(I).j_initial = j;
    initials(I).number = I;
end

%Takes size of initial_formation; I'm assuming size of target formation is
%the same;
s = size(initial_formation);

initials_fields = fieldnames(initials);
initials_cell = struct2cell(initials);
size = size(initials_cell);
initials_cell = reshape(initials_cell, size(1), []);
initials_cell = initials_cell';
initials_cell = sortrows(initials_cell, 2);
initials_cell = reshape(initials_cell', size);
initials_jsort = cell2struct(initials_cell, initials_fields, 1);
myStruct = instructions;

for I = 1:length(instructions)
    N = initials_jsort(I).number;
    instructions(N).i_target = myStruct(I).i_target;
    instructions(N).j_target = myStruct(I).j_target;
end

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
            instructions(I).direction = 'NE';
        else
            instructions(I).direction = 'SE';
        end
    else
        if(instructions(I).j_target == initials(I).j_initial)
            instructions(I).direction = 'W';
        elseif(instructions(I).j_target > initials(I).j_initial)
            instructions(I).direction = 'NW';
        else
            instructions(I).direction = 'SW';
        end
    end
end

targets_cell = initials_cell;

% I figure this for loop may come in handy sometime; Cycles through initial
% formation and target formation;
for M = 1:s(1)
    for N = 1:s(2)
        % if (M,N) is unoccupied in initial formation...;
        if(initial_formation(M,N) == 0)
        % if (M,N) is occupied in both initial position and target
        % position...;
        elseif~(initial_formation(M,N) == target_formation(M,N))
            
        end
    end
end
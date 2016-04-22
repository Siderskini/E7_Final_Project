%{
Okay so the point of this file is so we can test out our code with
arbitrary inputs without havign to call the entire function over and over
again. Just add your new target formation and initial formation in lines 11
and 12 and type 'test' into the editor. Also, it saves time in making your
test results every time you open matlab, as every time you open matlab,
your workspace is cleared. If this file becomes obsolete, we'll just get
rid of it. I just thought it held some time and effort benefits.
%}
load('sample_transitions.mat');
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

% Configures targets struct
targets = struct('i',[],'j',[],'num',[]);
for I = 1:length(instructions)
    targets(I).i = i(I);
    targets(I).j = j(I);
    targets(I).num = I;
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
size_initial = size(initials_cell);
initials_cell = reshape(initials_cell, size_initial(1), []);
initials_cell = initials_cell';
initials_cell = sortrows(initials_cell, 1);
for I = 1:length(initials_cell)
    count = 0;
    i_temp = initials_cell{I,1,1};
    for J = I+1:length(initials_cell)
        if(initials_cell{J,1,1} == i_temp)
            count = count + 1;
        end
    end
    if(count>0)
        temp = initials_cell(I:count+I,:,:);
        temp = sortrows(temp, 2);
        initials_cell(I:count+I,:,:) = temp;
        I = I + count;
    end
end
initials_cell2 = reshape(initials_cell', size_initial);
initials_ijsort = cell2struct(initials_cell2, initials_fields, 1);

targets_fields = fieldnames(targets);
targets_cell = struct2cell(targets);
size_target = size(targets_cell);
targets_cell = reshape(targets_cell, size_target(1), []);
targets_cell = targets_cell';
targets_cell = sortrows(targets_cell, 1);
for I = 1:length(targets_cell)
    count = 0;
    i_temp = targets_cell{I,1,1};
    for J = I+1:length(targets_cell)
        if(targets_cell{J,1,1} == i_temp)
            count = count + 1;
        end
    end
    if(count>0)
        temp = targets_cell(I:count+I,:,:);
        temp = sortrows(temp, 2);
        targets_cell(I:count+I,:,:) = temp;
        I = I + count;
    end
end
targets_cell2 = reshape(targets_cell', size_target);
targets_ijsort = cell2struct(targets_cell2, targets_fields, 1);

% Assigns targets
for I = 1:length(instructions)
    N = initials_ijsort(I).number;
    instructions(N).i_target = targets_ijsort(I).i;
    instructions(N).j_target = targets_ijsort(I).j;
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
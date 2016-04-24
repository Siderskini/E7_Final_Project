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

% Creates instructions_list
instructions_list = struct('instr',[]);

instructions = IJAssign(initials, targets, instructions);
instructions = directions(initials, instructions);
instructions_list(1).instr = instructions;
instructions = IJAssign(initials, targets, instructions);
instructions = directions(initials, instructions);
instructions_list(2).instr = instructions;
instructions = LSDAssign(initial_formation, target_formation);
instructions_list(3).instr = instructions;

% Accounts for all possible directions of marchers
instructions_list = direction_plus(instructions_list);

% Picks the best set of instructions
instructions = picker(instructions_list);



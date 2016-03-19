% Simple tests
target_formation = [1 0 0 1; 0 1 0 1; 1 0 1 0; 0 1 1 0];
initial_formation = [0 1 0 1; 0 1 1 0; 0 1 0 1; 1 1 0 0];


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

for I = 1:length(instructions)
    instructions(I).i_target = i(I);
    instructions(I).j_target = j(I);
end

[i,j] = find(initial_formation);

for I = 1:length(instructions)
    initials(I).i_initial = i(I);
    initials(I).j_initial = j(I);
end

%{
for M = 1:s(1)
    for N = 1:s(2)
        if(initial_formation(M,N) == 0)
        elseif~(initial_formation(M,N) == target_formation(M,N))
            
        end
    end
end
%}
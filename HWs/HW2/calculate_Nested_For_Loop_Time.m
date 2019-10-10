%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Calculates the time required to run nested-for-loops
%          for any desired value of n.
%
%Input: 1) N: Amount of iterations for each for-loop.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function time = calculate_Nested_For_Loop_Time(N)
tic
k=0;
for i1 = 1:N
    for i2 = 1:N
        for i3 = 1:N
            for i4 = 1:N
                k = k+1;
            end
        end
    end
end
time = toc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Computes t1 through tn of the square root sequence
%          and stores each ti in a vector.
%
%Input: 1) N: Amount of iterations to run the square
%             root sequence.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = squareRootSequence(m,n)

val = [];
for i=1:n
    sum = sqrt(m); %initialize to the inner most root
    %loops down to 2 since the inner most root has already been calculated
    for j=i:-1:2
        sum = sqrt(m + (-1)^(j+1)*sum); %even iterates correspond to odd powers of -1
    end
    val(i) = sum; %store each ti as a sequence in a vector
end

% m=13: sequence appears to converge to 3
% m=31: sequence appears to converge to 5
% m=43: sequence appears to converge to 6
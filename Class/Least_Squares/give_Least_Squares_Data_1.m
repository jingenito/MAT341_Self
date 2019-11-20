%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: creates data, {(x_i,y_i)}, for EXAMPLE 1 for students to
%           practice LINEAR LEAST SQUARES.
%
%           Input: N <-- # of data points to create
%
%           Output: MAT <-- Matrix of (x,y) values, where each row is a
%           different data point (x_i,y_i), e.g., MAT(i,:) = [x_i y_i]
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function MAT = give_Least_Squares_Data_1(N)

% get random values for data points
xVec = linspace(0,1,N);                         % gives N-equally spaced points between [0,1]
yVec = linspace(0,1,N)' + 0.5*(2*rand(N,1)-1);  % computes randomly assorted y-data for each corresponding x-Pt

% initialize matrix 
MAT = zeros(N,2);

% put x-Data and y-Data into 1st and 2nd columns of matrix MAT, respectively
MAT(:,1) = xVec;
MAT(:,2) = yVec;

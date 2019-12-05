%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% FUNCTION: creates data, {(x_i,y_i)}, for EXAMPLE 3 for students to
%           practice NON-LINEAR LEAST SQUARES.
%
%           Input: N <-- # of data points to create
%
%           Output: MAT <-- Matrix of (x,y) values, where each row is a
%           different data point (x_i,y_i), e.g., MAT(i,:) = [x_i y_i]
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function MAT = give_NonLinear_Least_Squares_Data(N)

% give x-data points
xVec = [linspace(-1,0,floor(N/6)) linspace(0,1,ceil(2/3*N)) linspace(1,2,ceil(N/6))];    % gives N-equally spaced points between [-1,2]

% fix total number of data points (bc of fractions)
N = floor(N/6) + ceil(N/6) + ceil(2*N/3);

%
% get y-data values (introduce random noise to make problem interesting...)
%
mu = 0.5;
sigma = 0.2;
r1 = 0.10*(2*rand(1,N)-1);    % shift [0,1] -> [-0.1,0.1]
r2 = (1.25-0.75)*rand(1,N)+0.75; % y = (b-a)x + a to shift [0,1]-> [a,b]
r3 = (1.25-0.5)*rand(1,N)+0.5;
r4 = (1.25-0.75)*rand(1,N)+0.75;
yVec = r4.*exp( -(xVec-mu.*r3).^2 ./ (2*sigma^2.*r2) ) + r1; % computes randomly assorted y-data for each corresponding x-Pt

% initialize matrix 
MAT = zeros(N,2);

% put x-Data and y-Data into 1st and 2nd columns of matrix MAT, respectively
MAT(:,1) = xVec;
MAT(:,2) = yVec;

% Plots the data!
fs = 18; % FontSize
ms = 12; % MarkerSize
plot(xVec,yVec,'k.','MarkerSize',ms); hold on;
leg=legend('data');
xlabel('x');
ylabel('y');
set(gca,'FontSize',fs);
set(leg,'FontSize',fs);

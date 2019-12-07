%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Makes two plots of the amount of operations required to row
%          reduce an NxN matrix to Reduced Row Echelon Form for a variety 
%          of N values.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plot_Gaussian_Elimination_Scaling()
NVec = 2:1:100; %set a vector of N values
opVec = []; %initialize an operation count vector

for i=1:length(NVec)
    opVec(i) = go_Go_Gaussian_Elimination(NVec(i));
end

%make both plots
lw = 5; %set line-width
color = 'blue'; %set color

figure(1);
loglog(NVec,opVec,'Color',color,'LineWidth',lw)
xlabel('Matrix Dimension: N')
ylabel('Operation Count')

figure(2);
plot(NVec,opVec,'Color',color,'LineWidth',lw)
xlabel('Matrix Dimension: N')
ylabel('Operation Count')

%(a)The number of operations required to row reduce a matrix scales
%   exponentially with N since the loglog plot is a line.

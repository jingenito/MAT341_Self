%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Implements a Linear Least Square Regression to fit a 12th degree
%          polynomial to the function cos(x) with N data points.
%
%Output: 1) l2-Norm of the residual vector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function fit_Polynomial_Series()
N = 250; %set number of data points
xData = linspace(-2*pi,2*pi,N); %create x vector
yData = cos(xData)'; %create a column vector for y values

A = []; %initialize A matrix
for i=1:length(xData)
    %fill A matrix
    for k=1:13
        A(i,k) = xData(i)^(k-1);
    end
end

%bVec = inv(A' * A)* A' * yData; %solve for beta vector
bVec = ((A' * A) \ A') * yData %using for better and faster approximation

xReg = []; %initialize regression vector
for i=1:length(xData)
    xReg(i,1) = xData(i);
    
    %calculate the polynomial value
    sum = 0;
    for k=1:13
        sum = sum + bVec(k)*xData(i)^(k-1);
    end
    xReg(i,2) = sum;
end

rVec = yData - A * bVec; %calculate the residual vector
l2_Norm = sqrt(rVec' * rVec) %calculate the l2 - norm

plot(xData,yData,'o','Color','blue','LineWidth',6)
hold on;
plot(xReg(:,1),xReg(:,2),'red','LineWidth',4)
xlabel('x');
ylabel('y');
legend('Data','Best Poly Fit');

%(a) N=10: l2-Norm = 2.6159e-11
%    N=50: l2-Norm = 5.1501e-04
%    N=250: l2-Norm = 0.0011
%    Incresing N increases the l2-Norm of the Residual Vector
%(b) Taylor Polynomial
%    +- 1/(2n)!
%(c)
%bVec =
%
%    0.9999
%    0.0000
%   -0.4998
%   -0.0000
%    0.0416
%    0.0000
%   -0.0014
%   -0.0000
%    0.0000
%    0.0000
%   -0.0000
%   -0.0000
%    0.0000
%(d) Every odd coefficient is 0, which is expected from the Taylor
%Expansion


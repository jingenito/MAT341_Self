%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Implements a Linear Least Square Regression to fit an Mth
%          degree polynomial to a function of sines and cosines.
%
%Output: 1) l2-Norm of the residual vector
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function fit_Sine_Series()
N = 500; %set the amount of data points
xData = linspace(-pi,pi,N); %create an x vector
yData = ( (0.25*xData.^2).* cos(xData).^4.* sin(xData).^7 )'; 
%create a column vector of y values
M = 40; %set the degree of the fit polynomial

A = []; %initialize A matrix
for i=1:length(xData)
    %fill A matrix
    for k=1:M+1
        A(i,k) = xData(i)^(k-1);
    end
end

%bVec = inv(A' * A)* A' * yData; %solve for beta vector
bVec = ((A' * A) \ A') * yData; %using for better and faster approximation

xReg = []; %initialize regression vector
for i=1:length(xData)
    xReg(i,1) = xData(i);
    
    %calculate the polynomial value
    sum = 0;
    for k=1:M+1
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
legend('Data','Best Sine Series Fit');

%(a) M = 5: l2-Norm = 0.1559
%    M = 10: l2-Norm = 0.1055
%    M = 20: l2-Norm = 0.0244
%    M = 40: l2-Norm = 0.0106
%    Increasing M decreases the l2-Norm of the residul vector.
%(b) Fourier Series

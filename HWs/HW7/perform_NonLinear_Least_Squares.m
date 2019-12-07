%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Performs a nonlinear least squares regression on data and plots
%          the data along with the regression on the same plot.
%
%Output: 1) err: Minimal l2-norm of the difference in beta vectors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function perform_NonLinear_Least_Squares()
N = 2500; %set the amount of data points
tol = 1e-5; %set the error tolerance
err = 1; %initialize the error

data = give_NonLinear_Least_Squares_Data(N); %get the data from the downloaded script
%create the x and y vectors 
xData = data(:,1);
yData = data(:,2);

bVec = [1 0.5 0.3]'; %set the beta vector 
while err > tol
    J = []; %initiailize the Jacobian Matrix
    for i=1:N
        expVal = exp((-(xData(i)-bVec(2))^2)/(2*bVec(3)^2));
        
        %create the Jacobian Row
        J(i,1) = expVal;
        J(i,2) = bVec(1)*((xData(i)-bVec(2))/(bVec(3)^2))*expVal;
        J(i,3) = bVec(1)*((xData(i)-bVec(2))^2/(bVec(3)^3))*expVal;
    end
    
    rVec = []; %initialize the residual vector
    for i=1:N
        expVal = exp((-(xData(i)-bVec(2))^2)/(2*bVec(3)^2));
        
        rVec(i) = yData(i) - bVec(1)*expVal;
    end
    
    pseudoInv = inv(J' * J) * J';
    bNewVec = bVec + pseudoInv*rVec';
    %calculate the l2-norm 
    err = sqrt((bNewVec-bVec)' * (bNewVec-bVec));
    %set beta vector to the new beta vector for the next iteration
    bVec = bNewVec;
end

err %output the minimal l2-norm of the difference vector

regData = []; %initialize the vector for the regression data
for i=1:N
    expVal = exp(-(xData(i)-bVec(2))^2/(2*bVec(3)^2));
    
    regData(i) = bVec(1)*expVal;
end

%create a new figure for the plot
figure(2);
plot(xData,yData,'k.','Color','blue','MarkerSize',20)
hold on;
plot(xData,regData,'Color','red','LineWidth',4)
xlabel('x');
ylabel('y');
legend('Data','Model Fit');

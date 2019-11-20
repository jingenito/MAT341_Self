%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Plots the amount of iterations required to converge to the
%          minimum value of the function for varying step sizes.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function vary_StepSize_Gamma_To_Optimize()
gammaVec = 0.1:0.1:1.9; %define the gamma vector
nVec = [];

for i=1:length(gammaVec)
    nVec(i) = Gradient_Descent_1(0.02,gammaVec(i)); %loop over gamma vector 
end

%plot the iterations vs gamma 
semilogx(gammaVec,nVec,'Color','blue','LineWidth',5)
xlabel('Gamma')
ylabel('N')
legend('Fixed Step') 

%(a) The best step size appears to be 1.
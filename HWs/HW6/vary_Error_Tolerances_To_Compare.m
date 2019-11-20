%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Plots the amount of iterations required to converge to the
%          minimum value of the function for varying error tolerances.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function vary_Error_Tolerances_To_Compare()
%set the error vector
errTolVec= [1e-1  1e-2  1e-3  1e-4  1e-5  1e-6  1e-7  1e-8  1e-9  1e-10  1e-11];
%initialize the gradient vectors
grad1 = [];
grad2 = [];

%loop over the error tolerances
for i=1:length(errTolVec)
    grad1(i) = Gradient_Descent_1(errTolVec(i),1);
    grad2(i) = Gradient_Descent_2(errTolVec(i));
end

%plot using semilogx and loglog
figure(1)
semilogx(errTolVec,grad1,'Color','blue','LineWidth',5)
hold on;
semilogx(errTolVec,grad2,'Color','red','LineWidth',5)
xlabel('Error Tolerance')
ylabel('Iterations')
legend('Fixed Step','Barzilai-Borwein')

figure(2)
loglog(errTolVec,grad1,'Color','blue','LineWidth',5)
hold on;
loglog(errTolVec,grad2,'Color','red','LineWidth',5)
xlabel('Error Tolerance')
ylabel('Iterations')
legend('Fixed Step','Barzilai-Borwein')

%(a) It appears that the Fixed-Step converged faster.
%(b) The Barzilai-Borwein step size converged faster.
%(c) The Barzilai-Borwein step size requires no prior knowledge about the
%function and what the optimal step size would be.
%(d) I would use the Barzilai-Borwein step size since I have no knowledge
%about the optimal step size.
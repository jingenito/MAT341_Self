%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Runs the two algorithms for varying error tolerances. Creates
%          two plots to model the amount of iterations required for each 
%          algorithm to find the minimum with the given accuracy. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function vary_Error_Tolerances_To_Compare()
%set the vector of error tolerances
errTolVec = [1e-1  1e-2  1e-3  1e-4  1e-5  1e-6  1e-7  1e-8  1e-9  1e-10  1e-11  1e-12];

%initialize the vectors for each corresponding algorithm
goldenVec = [];
parabolicVec = [];

%run each algorithm for each error tolerance
for i=1:length(errTolVec)
    goldenVec(i) = golden_Search(errTolVec(i));
    parabolicVec(i) = successive_Parabolic_Interpolation(errTolVec(i));
end

%plot the data on two types of plots
figure(1);
semilogx(errTolVec,goldenVec,'color','blue','LineWidth',5)
hold on;
semilogx(errTolVec,parabolicVec,'color','red','LineWidth',5)
xlabel('Error Tolerance')
ylabel('Iterations')
legend('Golden Search', 'Succ. Para. Interp.')
    
figure(2);
loglog(errTolVec,goldenVec,'color','blue','LineWidth',5)
hold on;
loglog(errTolVec,parabolicVec,'color','red','LineWidth',5)
xlabel('Error Tolerance')
ylabel('Iterations')
legend('Golden Search', 'Succ. Para. Interp.')

%(a) For less  accurate tolerances the Successive Parabolic Interpolation
%method appears to converge quicker.

%(b) As the accuracy threshold increases the Parabola method severely
%increases the amount of iterations beyond a certain threshold. The
%threshold appears to be about 1e-9.
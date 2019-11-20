%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Plot the amount of iterations required for various error tolerances 
%          to find a local minimum of the same function f(x) for various 
%          optimization methods.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function vary_Error_Tolerances_To_Compare()
%set the error vector
errTolVec = [1e-1  1e-2  1e-3  1e-4  1e-5  1e-6  1e-7  1e-8  1e-9  1e-10  1e-11  1e-12];

%initialize vectors to hold the iterations required for each method
goldenVec = [];
parabolicVec = [];
newtonVec = [];

for i=1:length(errTolVec)
    goldenVec(i) = golden_Search(errTolVec(i));
    parabolicVec(i) = successive_Parabolic_Interpolation(errTolVec(i));
    newtonVec(i) = Newtons_1D_Opt(errTolVec(i));
end

%plot on two seperate graphs: semilogx and loglog
figure(1);
semilogx(errTolVec,goldenVec,'color','blue','LineWidth',5)
hold on;
semilogx(errTolVec,parabolicVec,'color','red','LineWidth',5)
hold on;
semilogx(errTolVec,newtonVec,'color','black','LineWidth',5)
xlabel('Error Tolerance')
ylabel('Iterations')
legend('Golden Search', 'Succ. Para. Interp.', 'Newton Method')
    
figure(2);
loglog(errTolVec,goldenVec,'color','blue','LineWidth',5)
hold on;
loglog(errTolVec,parabolicVec,'color','red','LineWidth',5)
hold on;
loglog(errTolVec,newtonVec,'color','black','LineWidth',5)
xlabel('Error Tolerance')
ylabel('Iterations')
legend('Golden Search', 'Succ. Para. Interp.', 'Newton Method')

%(a) For less accurate tolerances it appears that the Successive Parabolic
%Interpolation converges faster.
%(b) When the accuracy threshold is increased, Newton's Method appears to
%converge faster.
%(c) The amount of iterations for each method depends on how "good" the
%initial guesses are.
function vary_Error_Tolerances_To_Compare()
errTolVec = [1e-1  1e-2  1e-3  1e-4  1e-5  1e-6  1e-7  1e-8  1e-9  1e-10  1e-11  1e-12];

goldenVec = [];
parabolicVec = [];

for i=1:length(errTolVec)
    goldenVec(i) = golden_Search(errTolVec(i));
    parabolicVec(i) = successive_Parabolic_Interpolation(errTolVec(i));
end

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
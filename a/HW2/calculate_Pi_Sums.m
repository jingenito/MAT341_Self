%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Determines the smallest integers, Na and Nb, such that
%          two convergent series converges to pi within a desired
%          tolerance.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function calculate_Pi_Sums()

tol = 1e-6; %set tolerance

%initializing each variable needed to calculate the sums
err = 1;
sum = 0; 
k = 0;

%sum for series: a
while err >= tol
    sum = sum + (6 / sqrt(3))*((-1)^k / ((3^k)*(2*k + 1)));
    k = k + 1; 
    
    err = abs(sum - pi); %recalculate the error
end

%output Na
Na = k-1 %k was incremented an extra time

%reset all variables for next sum
err = 1;
k = 0;
sum = 0;

%sum for series: b
while err >= tol
    %breaking the sum into parts
    sum1 = 16 * ((-1)^k / ((5^(2*k + 1))*(2*k + 1)));
    sum2 = 4 * ((-1)^k / ((239^(2*k + 1))*(2*k + 1)));
    sum = sum + (sum1 - sum2);
    k = k + 1;
    
    err = abs(sum - pi); %recalculate the error
end

%output Nb
Nb = k-1


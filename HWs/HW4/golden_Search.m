%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Implements the Golden Search Algorithm to find the minimum of 
%          f(x), specified in function f.m, and outputs the number of
%          iterations required to find the minimum with the specified accuracy.
%
%Input: 1) tol: tolerance
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = golden_Search(tol)
%initialize end points 
a = 0;
b = 2;
tau = (sqrt(5) - 1) / 2; %set to the golden ratio

%initialize first to guesses at the minimum
x1 = a + (1-tau)*(b-a);
x2 = a + tau*(b-a);

N = 0; %initialize counter to 0
while (b-a) > tol
    if f(x1) > f(x2)
        %set the lower bound to x1
        a = x1;
        %update guesses for the minimum
        x1 = x2;
        x2 = a + tau*(b-a);
    else
        %set the upper bound to x2
        b = x2;
        %update guesses for the minimum
        x2 = x1;
        x1 = a + (1-tau)*(b-a);
    end
    N = N + 1;
end

%This algorithm appears to take 40 iterations to find the minimum with 1e-8
%accuracy.
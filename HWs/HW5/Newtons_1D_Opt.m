%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Extends Newton's Method for finding roots of a function to
%          finding a local minimum of a function f(x).
%
%Input: 1) tol: tolerance
%Output: 1) N: number of iterations
%        2) min: local minumum of f(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = Newtons_1D_Opt(tol)
%initialize the variables
xn = 0.25; 
xn1 = 0;
err = 1;

N = 0;
while err > tol
    xn1 = xn - (fp(xn)/fpp(xn)); %use newton's method to find when fp(x) = 0
    
    err = abs(xn1 - xn); %calculate the error
    N = N + 1;
    xn = xn1; %set xn to be the previous guess for the next iteration
end
min = xn %output the minimum

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Evaluates the function f(x).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = f(x)
val = 0.5 - x*exp(-x^2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Evaluates the first derivative of the function f(x).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = fp(x)
val = exp(-x^2)*(2*(x^2) - 1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Evaluates the second derivative of the function f(x).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = fpp(x)
val = exp(-x^2)*(-4*(x^3)+6*x);

%(a) This method took 6 iterations.
%(b) The amount of iterations jumped to 736.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Extends Newton's Method into n-dimensions of finding roots of
%          vector functions to finding a local minimum of a vector function
%          f(x).
%
%Input: 1) tol: tolerance
%Output: 1) N: number of iterations
%        2) min: local minumum of f(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = Newtons_2D_Opt(tol)
%initialize variables
err = 1;
Xn = [-4.5; 4.5];

N = 0;
while err > tol
    H = [sin(Xn(1)) 0; 0 cos(Xn(2))]; %calculate the Hessian matrix
    Xn1 = Xn - H\fgrad(Xn); %apply newton's method to find when gradient is the 0 vector

    Xdiff = Xn1 - Xn; %calculate a difference vector to make the calculations easier
    err = sqrt(Xdiff' * Xdiff); %defined error as the square root of the inner product of xdiff with itself
    Xn = Xn1;
    N = N + 1;
end
min = f(Xn) %output the minimum of f(x)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Evaluates the vector function f(x).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = f(x)
val = -sin(x(1))-cos(x(2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Evaluates the gradient vector of f(x).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = fgrad(x)
val = [-cos(x(1)); sin(x(2))];

%(a) It took 5 iterations to find the minimum of -2.
%(b) It took 4 iteraations to find the minimum of -2.
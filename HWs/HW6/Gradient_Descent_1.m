%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Implements the Gradient Descent method for finding the minimum
%          value of a function f(x) using a fixed step size.
%
%Input: 1) tol: tolerance
%       2) gamma: step size
%Output: 1) N: number of iterations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = Gradient_Descent_1(tol,gamma)
Xn = [1; 1.5]; %initialize x vector
Xn1 = [0; 0];
err = 1; %initialize the error

N = 0;
while err >= tol
    Xn1 = Xn - gamma*fgrad(Xn); %calculate the next x vector
    
    diffX = Xn1 - Xn; %calculate the difference x vector
    err = sqrt(diffX' * diffX); %l^2 error calculation
    
    Xn = Xn1; %update Xn to the previous guess
    N = N + 1; %update N
end
%minX = Xn
%min = f(Xn)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Evaluates the vector function f(x).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function val = f(x)
val = -sin(x(1))-cos(x(2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Evaluates the gradient vector of f(x).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function vec = fgrad(x)
vec = [-cos(x(1)); sin(x(2))];

%(a) The number of iterations is 35.
%(b) The number of iterations is 12.
%(c) The number of iterations is 34.
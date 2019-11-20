%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Implements the Gradient Descent method for finding the minimum
%          value of a function f(x) using the Barzilai-Borwein step size
%          that changes on each iteration.
%
%Input: 1) tol: tolerance
%Output: 1) N: number of iterations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = Gradient_Descent_2(tol)
Xn = [1; 1.5]; %initialize x vector
Xn1 = [0; 0];
gamma = 0.5; %initialize gamma
err = 1; %initialize the error

N = 0;
while err >= tol
    Xn1 = Xn - gamma*fgrad(Xn); %calculate the next x vector
    
    diffX = Xn1 - Xn; %calculate the difference x vector
    err = sqrt(diffX' * diffX); %l^2 error calculation
    
    diffG = fgrad(Xn1) - fgrad(Xn); %calculate the difference gradient vector
    gamma = abs(diffX' * diffG) / (diffG' * diffG); %Barzilai-Borwein step size
    
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

%(a) The number of iterations is 6.
%(b) The number of iterations is 7.
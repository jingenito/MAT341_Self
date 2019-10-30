%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Implements the Successive Parabolic Interpolation Algorithm to 
%          find the minimum of f(x), specified in function f.m, and 
%          outputs the number of iterations required to find the minimum 
%          with the speicified accuracy.
%
%Input: 1) tol: tolerance
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = successive_Parabolic_Interpolation(tol)
%initialize first three x values
x1 = 0;
x2 = 0.6;
x3 = 1.2;

N = 0; %initialize counter to 0
while abs(x3 - x1) >= tol
    %solve the linear system to find the x values on the parabola
    A = [x1^2 x1 1; x2^2 x2 1; x3^2 x3 1]; %coefficient matrix 
    b = [f(x1); f(x2); f(x3)]; %b vector
    x = A\b; %matlab optimized version of inv(A)*b
    
    vertex = -x(2)/(2*x(1)); %algebraically find the vertex
    %update the x values
    x3 = x2;
    x2 = x1;
    x1 = vertex;
    N = N + 1;
end

%(a) This algorithm only appears to take 7 iterations to find the minimum 
%with 1e-8 accuracy.

%(b) The number of iterations increased to 11. Matlab is warning us that
%the matrix is close to singular or badly scaled. This means that the
%determinant of the coefficient matrix in the linear system is close to 0
%so the system is unsolvable. 
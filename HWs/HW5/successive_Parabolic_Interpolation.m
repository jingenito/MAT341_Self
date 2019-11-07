function N = successive_Parabolic_Interpolation(tol)
x1 = 0;
x2 = 0.6;
x3 = 0.9;

N = 0;
while abs(x3 - x1) >= tol
    A = [x1^2 x1 1; x2^2 x2 1; x3^2 x3 1];
    b = [f(x1); f(x2); f(x3)];
    x = A\b; %matlab optimized version of inv(A)*b
    
    vertex = -x(2)/(2*x(1));
    x3 = x2;
    x2 = x1;
    x1 = vertex;
    N = N + 1;
end

function val = f(x)
val = 0.5 - x*exp(-x^2);

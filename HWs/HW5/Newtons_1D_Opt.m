function N = Newtons_1D_Opt(tol)
xn = 0.25; %random value in [0,2]
xn1 = 0;
err = 1;

N = 0;
while err > tol
    xn1 = xn - (fp(xn)/fpp(xn));
    
    err = abs(xn1 - xn);
    N = N + 1;
    xn = xn1;
end

function val = fp(x)
val = exp(-x^2)*(2*(x^2) - 1);

function val = fpp(x)
val = exp(-x^2)*(-4*(x^3)+6*x);

%(a) This method took 6 iterations.
%(b) The amount of iterations jumped to 736.

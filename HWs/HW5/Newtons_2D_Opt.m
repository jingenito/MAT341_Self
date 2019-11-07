function N = Newtons_2D_Opt(tol)
err = 1;
Xn = [-4.5; 4.5];

N = 0;
while err > tol
    H = [sin(Xn(1)) 0; 0 cos(Xn(2))];
    Xn1 = Xn - H\fgrad(Xn);

    Xdiff = Xn1 - Xn;
    err = sqrt(Xdiff' * Xdiff);
    Xn = Xn1;
    N = N + 1;
end
min = f(Xn)

function val = f(x)
val = -sin(x(1))-cos(x(2));

function val = fgrad(x)
val = [-cos(x(1)); sin(x(2))];

%(a) It took 5 iterations to find the minimum of -2.
%(b) It took 4 iteraations to find the minimum of -2.
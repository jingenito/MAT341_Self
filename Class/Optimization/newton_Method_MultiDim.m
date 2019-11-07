function min = newton_Method_MultiDim()
tol = 1e-3;
err = 1;
Xn = [-0.25; 0.5];

while err > tol
    H = [-sin(Xn(1)) 0; 0 cos(Xn(2))];
    Xn1 = Xn - H\fgrad(Xn);

    Xdiff = Xn1 - Xn;
    err = sqrt(Xdiff' * Xdiff);
    Xn = Xn1;
end
min = Xn;

function val = fgrad(x)
val = [-cos(x(1)); sin(x(2))];


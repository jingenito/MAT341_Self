function min = newton_Method_Min()


function val = fp(x)
val = exp(-x^2)*(2*x^2 - 1);

function val = fpp(x)
val = exp(-x^2)*(-4*x^3+6*x);
function N = golden_Search(tol)
tau = (sqrt(5) - 1) / 2;

function val = f(x)
val = 0.5 - x*exp(-x^2);
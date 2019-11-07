function N = golden_Search(tol)
a = 0;
b = 2;
tau = (sqrt(5) - 1) / 2;

x1 = a + (1-tau)*(b-a);
x2 = a + tau*(b-a);

N = 0;
while (b-a) > tol
    if f(x1) > f(x2)
        a = x1;
        x1 = x2;
        x2 = a + tau*(b-a);
    else
        b = x2;
        x2 = x1;
        x1 = a + (1-tau)*(b-a);
    end
    N = N + 1;
end

function val = f(x)
val = 0.5 - x*exp(-x^2);

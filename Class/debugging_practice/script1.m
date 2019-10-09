function val = script1()

tol = 1e-10;
err = 1;
sum = 0;
n = -1;

while err >= tol
    n = n+1;
    sum = sum + 1/2^n;
    err = abs(sum - 2);
end
val = sum;
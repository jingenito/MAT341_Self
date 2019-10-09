function val = script3()

tol = 1e-10;
err = 1;
sum = 0;
n = -1;

while err >= tol
    n=n+1;
    for i=1:n
        sum = sum + 1/2^n;
    end
    err = abs(sum - 2);
end
val = sum;
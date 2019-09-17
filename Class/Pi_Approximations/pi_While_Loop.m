function val = pi_While_Loop()

val = 0;
tol = 10^(-6);
err = 1;
k = 0;

while err > tol
    val = val + 4*((-1)^k / (2*k + 1));
    k = k + 1;
    err = abs(val - pi);
end

k - 1
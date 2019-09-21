function val = compute_Divisors(n)
val = [1];
i = 2;
while i <= floor(sqrt(n))
    if mod(n,i) == 0
        val = [val, i, n/i];
    end
    i = i + 1;
end
val = sort([val, n]);
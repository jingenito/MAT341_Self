function val = e_Approx(n)
    val = 0;
    for i=1:n
        val = val + 1 / factorial(i-1);
    end
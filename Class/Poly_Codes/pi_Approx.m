function val = pi_Approx(n)
    val = 0;
    for i=1:n
        val = val + (-1)^i / (2*i + 1);
    end
    val = val * 4;
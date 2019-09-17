function val = pi2_Approx(n)
    val = 0;
    for i=1:n
        val = val + ((-1)^(i-1)) * (sqrt(3)^(2*(i-1)+1)) / (2*(i-1)+1);
    end
    val = val * 3;
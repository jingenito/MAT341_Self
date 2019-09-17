function val = pi3_Approx(n)
    val = 0;
    for i=1:n
        val = val + 6*((-1)^(i-1)*(1/sqrt(3))^(2*(i-1)+1)/(2*(i-1)+1));
    end
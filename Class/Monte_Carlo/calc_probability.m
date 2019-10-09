function prob = calc_probability(N,L,deg)
    count = 0;
    for i=1:N
        c = L*rand(1, deg+1);
        R = roots(c);
        if max(imag(R)) == 0
            count = count + 1;
        end
    end
    prob = count/N;
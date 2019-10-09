function estimate_modified_root_prob()
    N = 0:1:20;
    probVec = [];
    for i=1:length(N)
        probVec(i) = calc_probability(2.5e4,1,N(i));
    end
    
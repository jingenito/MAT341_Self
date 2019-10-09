function estimate_Root_Probability()
    LVec = [1e-3:0.5e-3:9e-3 1e-2:0.5e-2:9e-2 1e-1:0.5e-1:9e-1 1e0:0.5e0:10];
    
    probVec = [];
    for i=1:length(LVec)
        probVec(i) = calc_probability(2.5e4,LVec(i),2);
    end
    
    figure(1); 
    plot(LVec, probVec)
    
    figure(2);
    semilogx(LVec, probVec)
    
    figure(3);
    loglog(LVec, probVec)
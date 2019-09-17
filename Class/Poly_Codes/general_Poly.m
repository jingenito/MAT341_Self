function val = general_Poly(cVec, x)
    val = 0;
    for i=1:length(cVec)
        val = val + cVec(i) * x ^ (i - 1);
    end
end
function val = Series1()
    n = 1; %initialize counter
    err = 1; %initialize error 
    while err >= 0.01
        a(n) = 0; %initialize the sum to 0
        for j=1:n
            a(n) = a(n) + n / (n^2 + j^2); %calculate the sum from j to n
        end
        %need at least 2 terms to calculate the first error
        if n > 2
            err = abs(a(n-1) - a(n));
        end
        n = n + 1; %incrememt counter by 1
    end
    %print vector a for testing purposes
    a 
    val = n - 1; %n was incremented one extra time at the end of the while loop
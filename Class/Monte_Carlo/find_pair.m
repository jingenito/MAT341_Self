function find_pair()
for k = 1:15
    for n=1:15
        if n^k <= 2147483647
            m = 1;
            x = factorial(n) + 1;
            if sqrt(x) - floor(sqrt(x)) == 0
                while x ~= m^2
                    m = m + 1;
                end
                n
                m
            end
        end
        
        
    end
end


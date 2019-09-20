function is_It_Prime(n)
prime = true;

if n >= 2 
    for i=2:floor(sqrt(n))
        if mod(n, i) == 0
            a = 'Not Prime'
            prime = false;
            break;
        end
    end
end

if prime
    a = 'Prime'
end


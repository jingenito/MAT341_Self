function val = compute_GCD(n1, n2)

div1 = compute_Divisors(n1);
div2 = compute_Divisors(n2);

foundGCD = false;
for i=length(div1):-1:1
    for j=length(div2):-1:1
        if div1(i) == div2(j)
            val = div1(i);
            foundGCD = true;
            break;
        end
    end
    
    if foundGCD
        break;
    end
end
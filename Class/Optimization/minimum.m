function m = minimum()
    a = 0;
    b = 2;
    tol = 1e-4;
    err = 1;
    
    while err >= tol
        step = (b-a)/3;
        x1 = a + step;
        x2 = b - step;
        
        if f(x1) > f(x2)
            a = x1;
        elseif f(x1) < f(x2)
            b = x2;
        end
        err = abs(b-a);
    end
    m = f((b+a)/2);

function val = f(x)
    val = 0.5-x*exp(-x^2);
function pi = estimate_PI(N)
    
count = 0;
for i=1:N
    dist = throw_Dart();
    if dist <= 0.5
        count = count + 1;
    end
end
pi = 4*count/N;

function val = throw_Dart()
    x = 0.5 * rand();
    y = 0.5 * rand();
    val = sqrt(x^2 + y^2);
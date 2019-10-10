function lcm_val = calculate_LCM(x,y)

gcd = calculate_GCD(x, y);
lcm_val = (x * y) / gcd;


%function that calculates the GCD of two integers, to be used in
%calculate_LCM(x,y)
function gcd_val = calculate_GCD(x, y)

%calculate vectors of divisors for each integer
div_Vec_X = calculate_Divisors(x);
div_Vec_Y = calculate_Divisors(y);

%since each vector is sorted, looping backwards will guarantee that the
%first common divisor found will be the greatest common divisor
for i=length(div_Vec_X):-1:1
    for j=length(div_Vec_Y):-1:1
        if div_Vec_X(i) == div_Vec_Y(j)
            gcd_val = div_Vec_X(i); %set the gcd to the common divisor found
            return; %exit the function
        end
    end
end


%function that returns a sorted vector of the divisors of an integer
function div_Vec = calculate_Divisors(x)

div_Vec = [1]; %initialize the vector to just contain 1
i = 2; %initialize the counter to 2

while i <= x
    if mod(x,i) == 0
        div_Vec = [div_Vec i]; %append the factor to the vector
    end
    i = i + 1;
end






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Computes the Least Common Multiple of any two integers by
%          multiplying them together and dividing by their Greatest
%          Common Divisor.
%
%Input: 1) x: any integer
%       2) y: any integer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function lcm_val = calculate_LCM(x,y)

gcd = calculate_GCD(x, y);
lcm_val = (x * y) / gcd;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Computes the Greatest Common Divisor of any two integers by
%          looping backwards through a sorted list of divisors for each
%          integer until the first common divisor is found, which can be
%          guaranteed to be the Greatest Common Divisor since the list is
%          sorted.
%
%Input: 1) x: any integer
%       2) y: any integer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Computes a sorted vector of divisors for any integer.
%
%Input: 1) x: any integer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function div_Vec = calculate_Divisors(x)

div_Vec = [1]; %initialize the vector to just contain 1
i = 2; %initialize the counter to 2

while i <= x
    if mod(x,i) == 0
        div_Vec = [div_Vec i]; %append the factor to the vector
    end
    i = i + 1;
end






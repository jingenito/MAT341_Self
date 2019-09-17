%
% FUNCTION: p3 evaluates a quadratic polynomial
%
% Inputs: 1. a: vector of coefficients
%         2. x: scalar independent variable
%
% Returns: val of polynomial evaluated at x
%

function val = p3(a, x)
    val = a(1) + a(2)*x + a(3)*x^2;
end
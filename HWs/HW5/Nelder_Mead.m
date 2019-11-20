%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Implements the Nelder-Mead algorithm to calculate a local
%          minimum of a vector function f(x). 
%
%Input: 1) tol: tolerance
%Output: 1) N: number of iterations
%        2) min: local minumum of f(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function N = Nelder_Mead(tol)
X = [0.35 2.8; 4 4; 4.5 4.5]; %initialize a matrix of x vectors
%intialize other variables
sortedVals = [];
inds = [];
err = 1;

N = 0;
while err >= tol
    vals = [f(X(1,:)) f(X(2,:)) f(X(3,:))]; %create a vector of function values
    [sortedVals, inds] = sort(vals);  %sort the function values
    
    xmVec = 0.5*(X(inds(1),:)+X(inds(2),:)); %midpoint from x1 to x2
    xrVec = xmVec + (xmVec - X(inds(3),:)); %define reach vector
    %sortedVals(3) is the "worst" guess
    if f(xrVec) < sortedVals(3)
        X(inds(3),:) = xrVec;
    else
        %f(mid1) >= sortedVals(3)
        
        xcVec = 0.5*(xmVec + X(inds(3),:)); %define center vector
        if f(xcVec) < sortedVals(3)
            X(inds(3),:) = xcVec;
        else
            %f(mid2) >= sortedVals(3)
            %shrink the triangle towards X(inds(1),:)
            
            xm2Vec = 0.5*(X(inds(1),:)+X(inds(3),:)); %midpoint from x1 to x3
            X(1,:) = X(inds(1),:);
            X(2,:) = xmVec;
            X(3,:) = xm2Vec;
        end
    end
    err = abs(f(X(inds(1),:)) - f(X(inds(3),:))); %calculate error
    N = N + 1;
end
min = sortedVals(1) %output the minimum


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Evaluates the vector function f(x).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = f(x)
val = -(sin(x(1))+cos(x(2)));

%(a) It appears it takes 29 iterations
%(b) The minimum value appears to be -1.999999462242197, which is very
%close to -2. No because there are only six 9's as opposed to possibly
%having eight 9's.
%(c) The minimum it found this time is -1.999999992153997, the number of
%iterations appear to doubled from part (a).
%(d) The minimum it found this time is -1.999999957370859.
function N = Nelder_Mead(tol)
X = [0.35 2.8; 4 4; 4.5 4.5];
sortedVals = [];
inds = [];
err = 1;

N = 0;
while err >= tol
    vals = [f(X(1,:)) f(X(2,:)) f(X(3,:))];
    [sortedVals, inds] = sort(vals);
    
    xmVec = 0.5*(X(inds(1),:)+X(inds(2),:)); %midpoint from x1 to x2
    xrVec = xmVec + (xmVec - X(inds(3),:)); %define reach vector
    if f(xrVec) < sortedVals(3)
        X(inds(3),:) = xrVec;
    else
        %f(mid1) >= sortedVals(3)
        
        xcVec = 0.5*(xmVec + X(inds(3),:));
        if f(xcVec) < sortedVals(3)
            X(inds(3),:) = xcVec;
        else
            %f(mid2) >= sortedVals(3)
            %shrink the triangle towards X(inds(1),:)
            
            xm2Vec = 0.5*(X(inds(1),:)+X(inds(3),:));
            X(1,:) = X(inds(1),:);
            X(2,:) = xmVec;
            X(3,:) = xm2Vec;
        end
    end
    err = abs(f(X(inds(1),:)) - f(X(inds(3),:)));
    N = N + 1;
end
min = sortedVals(1)

function val = f(x)
val = -(sin(x(1))+cos(x(2)));

%(a) It appears it takes 29 iterations
%(b) The minimum value appears to be -1.999999462242197, which is very
%close to -2. No because there are only six 9's as opposed to possibly
%having eight 9's.
%(c) The minimum it found this time is -1.999999992153997, the number of
%iterations appear to doubled from part (a).
%(d) The minimum it found this time is -1.999999957370859.
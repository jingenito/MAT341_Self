function min = nelder_Mead()
%actual min is -2

tol = 1e-3;
X = [6*rand(1,2)-1; 6*rand(1,2)-1; 6*rand(1,2)-1];
sortedVals = [];
inds = [];

while abs(f(X(1,:)) - f(X(3,:))) >= tol
    vals = [f(X(1,:)) f(X(2,:)) f(X(3,:))];
    [sortedVals, inds] = sort(vals);
    
    midVec = mid_Point(X(inds(1),:),X(inds(2),:)); %midpoint from x1 to x2
    reachVec = midVec + (midVec - X(inds(3),:)); %define reach vector
    if f(reachVec) < sortedVals(3)
        X(inds(3),:) = reachVec;
    else
        %f(mid1) >= sortedVals(3)
        
        centerVec = 0.5*(midVec + X(inds(3),:));
        if f(centerVec) < sortedVals(3)
            X(inds(3),:) = centerVec;
        else
            %f(mid2) >= sortedVals(3)
            %shrink the triangle towards X(inds(1),:)
            
            mid2Vec = mid_Point(X(inds(1),:),X(inds(3),:));
            X(1,:) = X(inds(1),:);
            X(2,:) = midVec;
            X(3,:) = mid2Vec;
        end
    end
end
min = sortedVals(1);

function val = f(x)
val = -(sin(x(1))+cos(x(2)));

function mid = mid_Point(x1,x2)
mid = [(x1(1)+x2(1))/2 (x1(2)+x2(2))/2];
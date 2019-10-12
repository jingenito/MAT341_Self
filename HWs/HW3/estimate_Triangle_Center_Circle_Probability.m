%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Computes the probability of the triangle created by randomly
%          selecting 3 points on a circle of radius 2 would contain the 
%          origin, using a Monte Carlo method. 
%
%Input: 1) N: Amount of iterations to run the script
%
%Process: 1) randomize 3 points on the circle
%         2) calculate the y intercepts of the line that connects pairs of 
%         the 3 points
%         3) if at least one pair of y intercepts that are in the interval
%         [-2,2] contain y=0 in between them, then the resulting triangle
%         will contain the origrin.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function prob = estimate_Triangle_Center_Circle_Probability(N)

count = 0; %initialize the count to 0

for i=1:N
    thetaVec = 2*pi*rand(1,3); %randomized theta values for polar coordinates
    
    %3 coordinate pairs that define the vertices of the triangle using
    %polar coordinates
    x1Vec = [2*cos(thetaVec(1)) 2*sin(thetaVec(1))];
    x2Vec = [2*cos(thetaVec(2)) 2*sin(thetaVec(2))];
    x3Vec = [2*cos(thetaVec(3)) 2*sin(thetaVec(3))];
    
    %slope vectors for each pair of vertices -> needed to find the y
    %intercepts of the lines connecting each vertex
    mVec = [(x1Vec(2)-x2Vec(2))/(x1Vec(1)-x2Vec(1)) (x2Vec(2)-x3Vec(2))/(x2Vec(1)-x3Vec(1)) (x1Vec(2)-x3Vec(2))/(x1Vec(1)-x3Vec(1))];
    
    %y intercept vector for each line that connects the three vertices
    % b = y1 - m*x1  found from point slope form of a line
    bVec = [x1Vec(2)-mVec(1)*x1Vec(1) x2Vec(2)-mVec(2)*x2Vec(1) x3Vec(2)-mVec(3)*x3Vec(1)];
    
    for j=1:2
        if abs(bVec(j)) <= 2 && abs(bVec(j+1)) <= 2
            %we know the two intercepts are in the domain
            if bVec(j)*bVec(j+1) < 0
                %if multiplying the two intercepts gives a negative number
                %then one was negative and one was positive in which case 0
                %was between them
                count = count + 1;
                break; %need to break this for loop once this pair as has been 
                %found to prevent counting this case twice
            end
        end
    end
end

prob = count / N;
    
    
    
    
    
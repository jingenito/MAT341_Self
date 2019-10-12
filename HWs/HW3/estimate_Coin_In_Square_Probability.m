%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Computes the probability that a coin with radius r will land
%          inside a 1x1 box without touching the edges of the box.
%
%Input: 1) r: radius of the coin
%       2) N: amount of iterations
%
%Process: 1) randomly select a pair of coordinates in the interval [0,1] to
%         be defined as the midpoint of the coin after it lands.
%         2) coin is inside the box without touching the edges if:
%               a) 0 < x + r < 1
%               b) 0 < y + r < 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function prob = estimate_Coin_In_Square_Probability(r,N)

count = 0; %initialize count to 0

for i=1:N
    %vector specifies the coordinates of the midpoint of the coin
    xVec = rand(1,2); %simulate the coin toss by creating a random vector of x,y values in [0,1]
    
    %check if coin is inside the box without touching the edges.
    if xVec(1) + r < 1 && xVec(1) - r > 0 && xVec(2) + r < 1 && xVec(2) - r > 0
        count = count + 1;
    end
end

prob = count / N;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Computes probabilites that coins with varying radii will land
%          inside the 1x1 box and plots the probabilities vs the 
%          corresponding radius.
%
%Approximately r=0.15 will have 0.5 probability of landing in the square.
%Approximately r=0.35 will have 0.1 probability of landing in the square.
%Approximately r=0.45 will have 0.01 probability of landing in the square.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function vary_Radii_Plot()

rVec= [0.01:0.005:0.10 0.1:0.01:0.5]; %given radius vector
probVec = []; %initalize the probability vector to an empty vector

for i=1:length(rVec)
    probVec(i) = estimate_Coin_In_Square_Probability(rVec(i),1e5); %calculate probability for individual radius
end

plot(rVec,probVec)
xlabel('Radii')
ylabel('Probability')


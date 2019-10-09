%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION: estimate the probability of rolling a 5 on a fair die 
%           from using a Monte Carlo method.
% INPUT: 1) N: number of times to roll the die.
% OUTPUT: the probability of rolling a 5 on a fair die.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function prob = estimate_Die_Probability(N)

count5 = 0;
for i=1:N
    val = roll_Die();
    
    if val == 5
        count5 = count5 + 1;
    end
end
prob = count5 / N;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTION: rolls a fair die with values 1 through 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function val = roll_Die()
    val = ceil(6 * rand());

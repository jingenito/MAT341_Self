%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Loops through a vector of different values of n
%          to test the time to run nested-for-loops at each
%          value of n.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plotNestedTimes()
%set a vector of N values to test nested-for-loop timing
N = [1:1:10  20:10:100  125 150 175 200 225 250];
x = []; %initialize the x vector

for i=1:length(N)
    x(i) = calculateNestedForLoopTime(N(i));
end

loglog(N,x,'color','magenta','LineWidth',1.1)
xlabel('N')
ylabel('Times')
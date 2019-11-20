function bVec = Linear_Least_Squares_1(X)
A = [];

for i=1:length(X(:,1))
    A(i,1) = 1;
    A(i,2) = X(i,1);
end

bVec = inv(A' * A)*A' * X(:,2);

XReg = [];
for i=1:length(X(:,1))
    %XReg(i) = [X(i,1) bVec(1) + bVec(2)*X(i,1)];
    XReg(i,1) = X(i,1);
    XReg(i,2) = bVec(1) + bVec(2)*X(i,1);
end

figure(1);
plot(XReg(:,1),XReg(:,2))
hold on;
plot(X(:,1),X(:,2),'o')


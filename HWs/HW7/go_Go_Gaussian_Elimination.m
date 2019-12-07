%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%FUNCTION: Determines the amount of opertations required to row reduce an
%          NxN matrix to Reduced Row Echelon Form.
%
%Input: 1) N: Dimension of the Matrix
%Output: 1) OpCount: Amount of operations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function OpCount = go_Go_Gaussian_Elimination(N)
A = rand(N,N); %set an nxn matrix of random values
OpCount = 0; %initialize the counter

%Row Echelon Form
for i=1:N
    
    for j=i:N
        %Rj = (aji/aii)*Ri - Rj
        
        for k=1:N %applies the row operation
            c = (A(j,k) / A(i,i)); 
            OpCount = OpCount + 1;
            
            if j == i 
                A(j,k) = c;
            else
                val = c * A(i,k); 
                OpCount = OpCount + 1;
            
                A(j,k) = val - A(j,k);
                OpCount = OpCount + 1;
            end
            
        end
    end
end

%reduced row echelon form
for i=N:-1:2
    for j=i-1:-1:1
        c = A(j,i) * A(i,i);
        OpCount = OpCount + 1;
        
        A(j,i) = A(j,i) - c;
        OpCount = OpCount + 1;
    end
end





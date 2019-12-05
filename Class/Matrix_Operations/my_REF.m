function A = my_REF(n)
A = rand(n,n)

for i=1:n
    for j=1:n
        %check A(j,j) = 0
        if A(j,j) ~= 0 
            %Rj = (1/ajj) * Rj
            for k=j:n
                A(j,k) = (1 / A(j,j))*A(j,k);
            end
            
            
            %Rj1 = aj1jRj - Rj1
            for k=j:n
                
            end
            
        end
    end
end
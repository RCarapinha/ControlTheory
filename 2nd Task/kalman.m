function Omega = kalman(A,B)
    %size of the matrix A
    c=length(A);
    
    %controllability matrix initialization
    Omega=zeros(1,c);
    
    %computation of omega
    for k = 1:c
        Omega(k,:)=(A^(k-1))*B; %1st -> A^0*B = B. 2nd-> A^1*B = AB %Row
    end
end
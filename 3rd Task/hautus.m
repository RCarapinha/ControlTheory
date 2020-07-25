%Controllability Test - Hautus

function r = hautus(A,B,lambda)
    %size of the matrix A
    c=length(A);
    
    %identity matrix
    i=eye(c);
    
    %rank of the matrix
    r=rank([(lambda*i)-A B]);
end
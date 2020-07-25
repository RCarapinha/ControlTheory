function e = eigenvaluefeedbacksystem(A,B)
    %Agglomeration of matrices F
    F=zeros(2,8,4);
    %F matrices
    F(:,:,1)=[1,0,0,0,0,0,0,0;0,0,1,1,0,1,0,0];
    F(:,:,2)=[0,1,1,0,0,0,0,0;1,0,0,0,0,1,0,1]; 
    F(:,:,3)=[0,0,1,0,0,0,1,0;1,0,1,0,0,0,0,1]; 
    F(:,:,4)=[0,1,0,1,0,1,0,1;0,1,0,1,0,1,0,0];
    F(:,:,5)=[0,3,0,1,0,1,0,1;0,1,0,1,0,1,0,7];
    F(:,:,6)=[0,1,0,1,3,1,0,1;0,1,4,1,0,1,0,0];
    F(:,:,7)=[0,1,0,1,0,1,0,1;0,1,2,1,0,1,3,0];
    F(:,:,8)=[0,0,9,0,1,0,1,1;0,1,0,1,0,1,0,4];
    %matrix of eigenvalues, in which each line corresponds to a different F
    %matrix
    e = zeros(8,8);
    %cycle responsible for the calculation of the eigenvalues of the
    %system A+BF for each F matrix
    for i=1:8
        e(:,i)=eig(A+B*F(:,:,i));
    end
end
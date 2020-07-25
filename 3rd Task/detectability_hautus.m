function [] = detectability_hautus(A,C)
    %Identity Matrix
    iden = eye(size(A,1));
    
    %A eigenvalues
    e = eig(A);
    
    %Initalize Vectors
    observable_eig=[];
    non_observable_eig=[];
    
    %Testing for every eigenvalue, if the hautus matrix is full rank (rank = size) it means it's observable if not is non-observable
    for i=1:size(A,1)
        if(rank([e(i)*iden-A; C]) == size(A,1))
            observable_eig = [observable_eig; e(i)];
        else
            non_observable_eig = [non_observable_eig; e(i)];
        end
    end
    
    %Print
    %Observable
    if(size(observable_eig)~=0)
        fprintf('\nThe observable eigenvalues are:\n');
    else
        fprintf('\nThere are no observable eigenvalues. \n');
    end
    
    if(size(observable_eig)~=0)
        fprintf('\n%f+i%f\n',real(observable_eig),imag(observable_eig));
    end

    %Non-Observable
    if(size(non_observable_eig)~=0)
        fprintf('\nThe non-observable eigenvalues are:\n');
    else
        fprintf('\nThere are no non-observable eigenvalues. \n');
    end
    
    if(size(non_observable_eig)~=0)
        fprintf('\n%f+i%f\n',real(non_observable_eig),imag(non_observable_eig));
    end
end
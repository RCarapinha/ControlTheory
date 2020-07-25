%Stability Test - Kalman

function [] = stability_kalman(A,B)
    %Get size of matrix
    [m,~] = size(A);
    
    %First Iteration - Starting Values
    K = B;
    AB = B;

    %Kalman Algorithm -> [B AB A^2B A^3B]
    for i=1:m-1
        AB=A*AB;
        K=[K AB];
    end
    
    %Check if it's controllable or not
	R=rank(K);
	if R==m
        disp('Stable because is Controllable')
    elseif(real(eig(A))<0)
        disp('Stable because real part of eigen value is negative')
    else
        disp('Unstable')
	end
end
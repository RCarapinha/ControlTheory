%Controllability Test - Kalman

function [] = kalman(A,B)
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
        disp('Controllable')
	else
        disp('Uncontrollable')
	end
end
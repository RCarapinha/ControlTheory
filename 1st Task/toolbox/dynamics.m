function xdot = dynamics(t,x)
    % load variables from workspace
	global A;  
	global B;
    
    % create function
	xdot = A*x  +B*impulse_i(t);
end
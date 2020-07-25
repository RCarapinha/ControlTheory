function y = impulse_i(t)
    % Initialize a
    a = 1;
    
    % Impulse function
    if (t>=0 && t<=(1/a))
    	 y = a;
    else
        y = 0;
    end
end 
function y=K(tk)
    %K - % of control signal that changes the state of the system from
    %state x1 to x2
    global A;
    global B;
    
    %Functions
    fun = @(x)expm(-(A.*tk))*(B*(B.')).*expm(-(A.').*tk);
    y = integral(fun,0,tk,'ArrayValued',true);
end

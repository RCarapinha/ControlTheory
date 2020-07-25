function xdot=dynamics(t,x)
    %Global Variables
    global A;
    global B;
    
    %Function
    xdot=A*x+B*control_i(t);
end

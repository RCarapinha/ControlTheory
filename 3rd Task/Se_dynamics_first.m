%Function needed - See again

function xdot=Se_dynamics_first(t,x)
    global A B;
    xdot=A*x+B*x;
end
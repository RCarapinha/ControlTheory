%Function needed

function xdot=Fi_dynamics(t,x)
    global K;
    global A;
    global B;
    xdot=A*x+B*(K*x);
end
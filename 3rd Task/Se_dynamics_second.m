%Function needed

function xhatdot=Se_dynamics_second(t,xhat)
    global A B C x;
    y = C*x;
    u = F*xhat;
    xhatdot =(A-L*C)*xhat+B*u+L*y;
end
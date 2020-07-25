function xdot=dynamics_first(t,x)
    global A
    global B
    global Kc
    xdot=A*x-B*(Kc*x);
end

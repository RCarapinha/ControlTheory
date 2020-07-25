function u=control_i(t)
    global signal_name;
    signal_name='u_x1_x2';
    u=feval(signal_name,t);
end
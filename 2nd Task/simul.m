function [t,x] = simul(As,Bs,tks,control_signal_name)
    %Initialize Variables
    global A;
    global B;
    global tf;
    global signal_name;
    
    %Value assignement to Global Variables
    A=As;
    B=Bs;
    tf = tks;
    signal_name = control_signal_name;
    
    %Equation solving
    [t,x]=ode45(@dynamics, [0 tf], [0;0;0]);
end
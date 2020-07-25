function [t,x,y] = simul_tn(As,Cs,tks,x0s)
    %Initialize Variables
    global A;
    global B;
    global tk;
    global signal_name;
    
    %Assign values
    A=As;
    B=[0;0;1];
    tk=tks;
    signal_name='u_zero';
    
    %Functions
    [t,x]=ode45(@dynamics, [0 tks], x0s);
    y=Cs*x';
    
    figure;
    hold on;
    plot(t,x,'blue');
    plot(t,y,'red');
    grid on;
    xlabel('Time(s)');
    legend('x1','x2','x3','y');
end


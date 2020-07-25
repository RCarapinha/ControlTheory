function [t,x]=simul_x1_x2(As, Bs, x1s, x2s, tks)
    %Global Variables
    global A;
    global B;
    global tk;
    global signal_name;
    global x1;
    global x2;

    %Initialize them
    A=As;
    B=Bs;
    tk=tks;
    signal_name='u_x1_x2';
    x1=x1s;
    x2=x2s;
    [t,x]=ode45(@dynamics,[0 tk],[0,0,0]);

    %Plot trajectories
    plot3(x(:,1), x(:,2), x(:,3));

    xlabel('x_1');
    ylabel('x_2');
    zlabel('x_3');
end
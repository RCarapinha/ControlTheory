function [] = StateFeedbackSystem()
    
    close all;
    
    %global variables
    global A B C;
    
    %system
    desired_eig=[-4,-8,-6,-7,-5,-3];
    K=place(A,B,desired_eig);
    sys=ss(A-B*K,zeros(size(A,1),1),C,0);
    
    %time response of the system
    t=0:.01:5;
    init_conds=[-5,0,0,0,0,0];
    lsim(sys,zeros(size(t,2),1),t,init_conds);
    
                                        %GIVEN PARAMETERS
    
    %system
    global Kc
    given_eig=[-7.5+.3j,-6.5+.9j,-3.3+2.3j,-7.5-.3j,-6.5-.9j,-3.3-2.3j];
    Kc=place(A,B,given_eig);
    
    %time response of the system
    [t,x]=ode45(@dynamics_first,[0.0 8], init_conds);
    y=zeros(size(x,1),3);
    for i=1:size(x,1)
        y(i,:)=C*x(i,:)';
    end
    
    %State plot
    figure();
    plot(t,y);
    title('Output Plot');
    ylabel('State values');
    xlabel('Time');
    legend('Cart','1st Pendulum','2nd Pendulum');
    
    %ANSWER: Fully real eigenvalues are a better solution, in a sense that
    %they dont imply system oscillations, achieving a smooth convergence
    %from the system to convergence
    
    %SMALL DETAIL: The car goes back and forward, as if to balance the
    %pendulums to maintain their position, countering their momentum.
    %We can see that the car almost moves to counter the angles of the
    %pendulum, oscillating until the angle reaches the desired equilibrium
    %position

end
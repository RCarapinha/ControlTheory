function [] = nonlinearsysLinearFeedback(x,t)

    close all;
    
    %global variables
    global A B C;
    init_conds=[.1,0,0,0,0,0];
    
    %system
    desired_eig=[-4,-8,-6,-7,-5,-3];
    K=place(A,B,desired_eig);
    K=-K;
    
    global f1 f2 f3 f4 f5 f6;
    
    f1=K(1);
    f2=K(2);
    f3=K(3);
    f4=K(4);
    f5=K(5);
    f6=K(6);
                                        %GIVEN PARAMETERS
    
    %time response of the system
    [t,x]=ode45(@nonlinearsys,[0.0 8], init_conds);
    y=zeros(size(x,1),3);
    for i=1:size(x,1)
        y(i,:)=C*x(i,:)';
    end
    
    %State plot
    figure();
    plot(t,y);
    title('Output Plot for the Non-Linear System');
    ylabel('State values');
    xlabel('Time');
    legend('Cart','1st Pendulum','2nd Pendulum');
end
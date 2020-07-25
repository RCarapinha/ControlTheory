function [] = StateControllerSystem()
    
    close all

    %global variables
    global A B C;
    
    %system
    %SYSTEM'S GAIN
    desired_eig=[-4,-8,-6,-7,-5,-3];
    K=place(A,B,desired_eig);
    %OBSERVER'S GAIN
    proposed_eigs=[-10 -10 -5 -3 -1 -1];
    L=place(A',C',proposed_eigs);
    %FINAL SYSTEM
    newA = [A-B*K B*K zeros(size(A)) A-L'*C];
    newB = [B zeros(size(B))];
    newC = [C zeros(size(C))];
    %SYSTEM SIMULATION
    %1st scenario
    x0=[-5 0 0 0 0 0]; %initial x0
    e0=[0 0 0 0 0 0]; %initial error (1st scenario)
    sys=ss(newA,newB,newC,0);
    t=0:.05:5;
    [y,t,x]=lsim(sys,zeros(size(t,2),1),t,[x0 e0]);
    
    %System Plotting
    figure();
    plot(t,x(:,1:3));
    xlabel('Time(s)')
    ylabel('x');
    title('System states');
    legend('x1','x2','x3');
    
    %2nd scenario
    e0=[.1 .1 .1 .1 .1 .1]; %initial error (2nd scenario)
    t=0:.05:5;
    [y,t,x]=lsim(sys,zeros(size(t,2),1),t,[x0 e0]);
    figure();
    %System Plotting
    plot(t,x(:,1:3));
    xlabel('Time(s)')
    ylabel('x');
    title('System states');
    legend('x1','x2','x3');
    
    %3rd scenario
    e0=[5 5 5 5 5 5]; %initial error (my scenario)
    t=0:.05:5;
    [y,t,x]=lsim(sys,zeros(size(t,2),1),t,[x0 e0]);
    figure();
    %System Plotting
    plot(t,x(:,1:3));
    xlabel('Time(s)')
    ylabel('x');
    title('System states');
    legend('x1','x2','x3');
    
    %3rd scenario
    e0=[-6 0 0 0 0 0]; %initial error (3rd scenario)
    t=0:.05:5;
    [y,t,x]=lsim(sys,zeros(size(t,2),1),t,[x0 e0]);
    figure();
    %System Plotting
    plot(t,x(:,1:3));
    xlabel('Time(s)')
    ylabel('x');
    title('System states');
    legend('x1','x2','x3');
    
    %ANSWER: The obtained results when the controller has the same exact
    %error(or is "reseted") is really good, considering the low overshoot
    %and settling time in order to stabilize the system in the required
    %equilibrium point. In the third scenario, we have one component with
    %non-null error and the other ones with null error, producing in the
    %graph a response with a much larger settling time and overshoot,
    %proving that in order to sucessfully use this controller, one must
    %reset it first to a state with homogeneous error (equal for every
    %component of the current state of the estimator) in order to increase
    %stability performance.
end
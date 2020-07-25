function [] = unobservable_system_newpoles(A,B,C)
    
    %initial conditions
    x0=[0 1 0 1 0 0 0.1 0];
    
    %input
    eigs=[-1+5j -7+5j -15+5j -20+5j -.4+5j -10+5j -3+5j -2+5j]; %eigenvalues
    K=place(A,B,eigs); %K
    L=place(A',C',eigs); %L
    
    %A,B and C of the new system with the real x and the error
    %PS - I inverted the symbol of K inside the matrix because i initially
    %deducted this using u=-k*x and not u=k*x
    newA = [A-B*K B*K zeros(size(A)) A-L'*C];
    newB = [B zeros(size(B))];
    newC = [C zeros(size(C))];
    
    %simulation of the new system
    sys=ss(newA, newB, newC, 0);
    t=0:.1:10;
    [y,t,x]=lsim(sys, zeros(size(t,2),2), t, [x0 x0]);
    
    %separation of the resulting states: first 8 elements are estimated_x
    %and the last 8 elements are the state errors
    n = 8;
    e = x(:,n+1:end);
    x = x(:,1:n);
    x_est = x - e;
    
    %plotting of the real x
    plot(t,x);
    xlabel('Time(s)')
    ylabel('x');
    title('System states');
    
    %plotting of y
    figure();
    plot(t,y);
    xlabel('Time(s)');
    title('System output');
    
    %plotting of the estimated x
    figure();
    plot(t,x_est);
    xlabel('Time(s)');
    ylabel('Estimated x');
    title('Observers system state');
    
    %plotting of the input control signal
    figure();
    plot(t,L(1,:)*x_est');
    hold on;
    plot(t,L(2,:)*x_est');
    xlabel('Time(s)');
    ylabel('u');
    title('Input');
    hold off;
    
    %plotting of the error commited between estimated and real x's
    figure();
    plot(t,e);
    xlabel('Time(s)');
    ylabel('Error');
    title('Error commited between the real system state and the observers prediction');
    
    %plotting of the ratio
    figure();
    plot(t,x_est./x);
    xlabel('Time(s)');
    ylabel('x_est/x');
    title('Observer and real system state ratio');

end
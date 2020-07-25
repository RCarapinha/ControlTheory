function [] = StateObserverSystem()
    close all;
    
    %global variables
    global A B C;
    
    %system
    desired_eigs=[-2 -9 -4 -5 -1 -.5]; 
    proposed_eigs=[-10 -10 -5 -3 -1 -1];
    L=place(A',C',proposed_eigs);
    sym=ss(A-L'*C,zeros(size(A,1),1),C,0); %edot=(A-LC)e
    
    %system's response
    t=0:.01:5;
    initial_errors=[5,0,0,0,0,0];
    lsim(sym,zeros(size(t,2),1),t,initial_errors);
end
%When we increase the absolute value of the imag part the output
%oscillation frequency rises

function [] = Fi_plot_system(Az,Bz,Cz)
    global K A B C;
    
    A = Az;
    B = Bz;
    C = Cz;
    
    %p=[-1 -2 -3 -4 -5 -6 -7 -8];
    %p=[-4-1i -4+1i -1-1i -1-1i -2-1i  -2+1i -3-1i  -3+1i];
    p=[-4-4*1i -4+4*1i -1-4*1i -1-4*1i -2-4*1i  -2+4*1i -3-4*1i  -3+4*1i];
    
    K=-place(A,B,p);
    [t,x]=ode45(@Fi_dynamics,[0 10], [1;1;1;1;1;1;1;1]);
    
    %output calculation
    y=zeros(size(x,1),2);
    for i=1:size(x,1)
        y(i,:)=C*x(i,:)';
    end
    
    %State plot
    figure();
    plot(t,x);
    title('States Plot');
    ylabel('State values');
    xlabel('Time');
    
    %Output plot
    figure;
    plot(t,y);
    title('Output Plot');
    ylabel('Output values');
    xlabel('Time');
    
    %Input plot
    figure();
    plot(t,K*x');
    title('Input Plot');
    ylabel('Input values');
    xlabel('Time');
end
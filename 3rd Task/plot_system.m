function [] = plot_system(Az,Bz,Cz)
    global K A B C;
    
    A = Az;
    B = Bz;
    C = Cz;
    
    eig1=(eig(A));
    K=place(A,B,eig1);
    [t,x]=ode45(@dynamics,[0 10], [1;1;1;1;1;1;1;1]);
    
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
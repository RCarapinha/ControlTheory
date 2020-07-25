%Plot Hautus

function [] = Fi_plot_h(A,B)
    %get eigenvalues of matrix A, return a matrix
    E=eig(A);
    
    %real and complex matrix of the eigenvalue array
    R=real(E);
    C=imag(E);
    
    %Min for plot
    minR = min(R)-10;
    minC = min(C)-10;
    
    %Max for plot
    maxR = max(R)+10;
    maxC = max(C)+10;
    
    %Step for plot
    stepR = (maxR-minR)/20;
    stepC = (maxC-minC)/20;
    
    %Vectors for the grid
    RVector = minR:stepR:maxR;
    CVector = minC:stepC:maxC;
    
    %This will be used to draw the space of the rank (it's a meshgrid)
    [gridR,gridC]=meshgrid(RVector,CVector);
    
    %let's get the ranks by using the hautus function
    for i=1:size(gridR,1)
        for j=1:size(gridR,2)
            ranks(i,j)=hautus(A,B,gridR(i,j)+gridC(i,j)*i);
        end
    end
    
    %plotting of the ranks for the grid
    figure;
    hold on;
    mesh(gridR,gridC,ranks);
    xlabel('Real');
    ylabel('Imag');
    zlabel('Rank');
    title('Hautus Test');
    grid on;
    
    %Plot of all values (hautus function)
    for k=1:size(E,1)
        plot3(R(k),C(k),hautus(A,B,E(k)),'*');
    end
end
function [] = space(M)
    %This will give us orthonomal basis
    %M' is the column
    column=orth(M');
    
    %Number of columns in orth(M') is equal to the rank
    r = size(column,2);
    
    figure
    xlabel('x1');
    ylabel('x2');
    zlabel('x3');
    title('Space Plot');
    
    %plotting of the column spaces
    if(r == 1)      %rank = 1
        plot3(column(:,1),[0;0;0],[0;0;0]);
    elseif(r == 2)  %rank = 2
        plot3(column(:,1),column(:,2),[0;0;0]);
    else            %rank = 3
        plot3(column(:,1),column(:,2),column(:,3));
    end
    grid on
    
end
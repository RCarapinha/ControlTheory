function [] = sort_N(matrix) 
    % load database from workspace
    global database; 
    
    % get size of database
    c=length(database);
    
    %Initialize the variable
    Determ = [];
    
    %Calculate determinant and concatenate to a new array
    for i=1:c
        Determ = [Determ; norm(database(i).(matrix))];
    end
    
    %Sort determinants and say which system is it
    [~,I] = sort(Determ);
    
    % more ON enables paging of the output in the MATLAB command window.
    more on;
    
    % display sorted
    for i=1:c
        disp(database(I(i)).name); 
    end
    
    % more OFF disables paging of the output in the MATLAB command window.
    more OFF;
end
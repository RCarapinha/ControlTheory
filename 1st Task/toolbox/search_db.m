function [] = search_db(search_string)
    % load database from workspace
    global database; 
    
    % get size of database
    c=length(database); 

    % more ON enables paging of the output in the MATLAB command window.
    more ON; 
    
    % display every system that contains the string
    for i=1:c
        if contains(database(i).name,search_string)
            disp(database(i).name)
        end
    end
    
    % more OFF disables paging of the output in the MATLAB command window.
    more OFF; 
end
function [] = contents_db()
    % load database from workspace
    global database;
    
    % get size of database
    c=length(database);
    
    %more ON enables paging of the output in the MATLAB command window.
    more on 
    
    for i=1:c
        disp(database(i).name)
    end
    
    %more OFF disables paging of the output in the MATLAB command window.
    more off
end
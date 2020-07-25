function [] = stable_s()
    % load database from workspace
    global database;
    
    % get size of database
    c=length(database);
    
    %Display all stable systems
    disp("Stable systems:");
    for i=1:c
        if all(real(eig(database(i).A))<0)
            disp(database(i).name);
        end
    end
end
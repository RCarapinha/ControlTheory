function [] = save_db(filename)
    % load database from workspace
    global database;

    % create file and write to it
    file = fopen(filename,'w');
    
    % get size of database
    c=length(database);

    % print on file the database
    for i=1:c
        fprintf(file,'%s \r\n',database(i).name);
        fprintf(file,'%s \r\n',mat2str(database(i).A));
        fprintf(file,'%s \r\n',mat2str(database(i).B));
        fprintf(file,'%s \r\n',mat2str(database(i).C));
        fprintf(file,'%s \r\n',mat2str(database(i).D));
    end
    
    fclose(file);
end
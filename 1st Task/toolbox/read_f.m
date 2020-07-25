function [] = read_f(filename)
    % load database from workspace
    global database;

    % open handle for file
    file=fopen(filename, 'r'); 
    
    % create struct
    tmp_model = struct ('name','','A','','B','','C','','D','');
    
    % Read one line at a time until the end of the file. This while will
    % put the systems in the database as a struct with all the parameters
    % of the file
    while ~feof(file)
        name = fgetl(file);
        tmp_model.name = name;
        tmp_model.A = eval(fgetl(file));
        tmp_model.B = eval(fgetl(file));
        tmp_model.C = eval(fgetl(file));
        tmp_model.D = eval(fgetl(file));
        database=[database;tmp_model];
    end
    
    %Close the file
    fclose(file);
end
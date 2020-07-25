function [] = read_k()
    global database; 
    tmp_model = struct ('name','','A','','B','','C','','D',''); 
    
    %Ask user for details
    tmp_model.name = input('System Name: ','s');
    tmp_model.A = eval(input('Enter Matrix A : ','s'));
    tmp_model.B = eval(input('Enter Matrix B : ','s'));
    tmp_model.C = eval(input('Enter Matrix C : ','s'));
    tmp_model.D = eval(input('Enter Matrix D : ','s'));
    
    %put new system in database
    database=[database;tmp_model]; 
end 
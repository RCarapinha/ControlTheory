function []=plots(name,tf)  
    % load variables from workspace
    global database
    global A
    global B
    
    %Find only the length of the second dimension of database
    c=length(database);
    
    for i=1:c
        if(~isempty(strfind(database(i).name, name))) %~isempty==determine wether the array is not empty strfind(finds the string "name" from database(d).tmp_model and returns in which position it is like 3rd letter or 10th                                                                                           
            figure;
            
            %Create state-space model, convert to state-space model
            sys=ss(database(i).A,database(i).B,database(i).C,database(i).D);
                        
            %First plot
            subplot(2,1,1);
            impulse(sys,tf);
            
            %Second Plot
            subplot(2,1,2);
            if(size(database(i).A,1)>3)
                msg='dim x > 3';
                text(0.25,0.25,msg);
            else
                A=database(i).A;
                B=database(i).B;
                if(size(database(i).A,1)==2)
                    [~,y1]=ode23(@dynamics, [0 tf], [0;0]);
                    plot(y1(:,1),y1(:,2));
                    xlabel('x1');
                    ylabel('x2');
                    title('State Space Trajectories');  
                end
                
                if(size(database(i).A,1)==3)
                    [~,y1]=ode23(@dynamics, [0 tf], [0;0;0]);
                    plot3(y1(:,1),y1(:,2),y1(:,3));
                    title('State Space Trajectories');
                    xlabel('x1');
                    ylabel('x2');
                    zlabel('x3');
                end
            end   
        end
    end  
end
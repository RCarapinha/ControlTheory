function y=dK(t)
    %Global Variables
    global A;
    global B;
    
    %Function
    y=expm(-(A.*t))*(B*(B.')).*expm(-(A.').*t);
end

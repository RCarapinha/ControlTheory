function u=u_x1_x2(t)
    %Global Variables
    global A;
    global B;
    global x1;
    global x2;
    global tk;
    
    %Initialize them
    tk=t;
    
    %Functions
    x=inv(K(tk))*(expm(-A*tk)*x2-x1);
    u=B'*expm(-A'*t).*x;
end

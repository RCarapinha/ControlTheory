%Parameters
global M1 M2 M L1 L2 g;

M1=10;
M2=10;
M=100;
L1=2;
L2=1;
g=10;

%matrices of the system
global A B C;

A42=-g*(L1*(M1+M2)+L2*M2)/(L1*M);
A43=-g*L2*M2/(L1*M);
A52=g*(L1*M1*(M+M1+M2)+L2*M2*(M+M1))/(M1*M*L1.^2);
A53=g*M2*(-L1*M+L2*(M+M1))/(M*M1*L1.^2);
A62=-g*M2/(L1*M1);
A63=g*(L1*(M1+M2)-L2*M2)/(L1*L2*M1);
A=[0 0 0 1 0 0;0 0 0 0 1 0;0 0 0 0 0 1;0 A42 A43 0 0 0;0 A52 A53 0 0 0;0 A62 A63 0 0 0];
B=[0;0;0;1/M;-1/(L1*M);0];
C=[1 0 0 0 0 0;1 L1 0 0 0 0;1 L1+L2 L2 0 0 0];
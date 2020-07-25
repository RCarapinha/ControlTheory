function [ dx ] = dynamics_obs ( t,x )
%DYNAMICS Summary of this function goes here
%   Detailed explanation goes here

global A B C F L;

global g M M1 M2 L1 L2;

q = x(1);
theta1 = x(2);
theta2 = x(3);
dq = x(4);
dtheta1 = x(5);
dtheta2 = x(6);
x_hat = x(7:12);

% observer based u

u = F*x_hat;

dx = zeros(12,1);

dx(1) = dq;
dx(2) = dtheta1;
dx(3) = dtheta2;

% dx(4) = -(40*u + 1600*dtheta1^2*sin(theta1) - 20*u*cos(theta2)^2 - 7848*cos(theta1)*sin(theta1) - 3924*cos(theta1 + theta2)*sin(theta1 + theta2) + 400*dtheta2^2*sin(theta1 + theta2) - 1962*sin(theta1 + theta2)*cos(theta1) - 200*dtheta2^2*sin(theta1 + theta2)*cos(theta2)^2 - 800*dtheta1^2*cos(theta2)^2*sin(theta1) + 981*cos(theta1 + theta2)*sin(theta1 + theta2)*cos(theta2) + 3924*cos(theta1 + theta2)*cos(theta2)*sin(theta1) + 3924*sin(theta1 + theta2)*cos(theta1)*cos(theta2) - 400*dtheta2^2*cos(theta1)*sin(theta2) + 400*dtheta1*dtheta2*sin(theta1 + theta2) - 200*dtheta1*dtheta2*sin(theta1 + theta2)*cos(theta2)^2 + 200*dtheta2^2*cos(theta1 + theta2)*cos(theta2)*sin(theta2) - 400*dq*dtheta1*cos(theta1 + theta2)*sin(theta1 + theta2) + 200*dq*dtheta2*sin(theta1 + theta2)*cos(theta1) - 100*dq*dtheta2*cos(theta1 + theta2)*sin(theta1 + theta2)*cos(theta2) + 400*dq*dtheta1*sin(theta1 + theta2)*cos(theta1)*cos(theta2))/(400*(cos(theta1 + theta2)^2 + 2*cos(theta1)^2 + 6*cos(theta2)^2 - 2*cos(theta1 + theta2)*cos(theta1)*cos(theta2) - 12));
% dx(5) = -(11772*sin(theta1 + theta2) + 47088*sin(theta1) + 2400*dtheta2^2*sin(theta2) - 981*cos(theta1 + theta2)^2*sin(theta1 + theta2) - 3924*cos(theta1 + theta2)^2*sin(theta1) - 40*u*cos(theta1) - 23544*sin(theta1 + theta2)*cos(theta2) - 200*dtheta2^2*cos(theta1 + theta2)^2*sin(theta2) + 20*u*cos(theta1 + theta2)*cos(theta2) + 3924*cos(theta1 + theta2)*sin(theta1 + theta2)*cos(theta1) - 400*dtheta2^2*sin(theta1 + theta2)*cos(theta1) - 1600*dtheta1^2*cos(theta1)*sin(theta1) - 1200*dq*dtheta2*sin(theta1 + theta2) + 200*dtheta2^2*cos(theta1 + theta2)*sin(theta1 + theta2)*cos(theta2) + 800*dtheta1^2*cos(theta1 + theta2)*cos(theta2)*sin(theta1) - 2400*dq*dtheta1*sin(theta1 + theta2)*cos(theta2) - 400*dtheta1*dtheta2*sin(theta1 + theta2)*cos(theta1) + 100*dq*dtheta2*cos(theta1 + theta2)^2*sin(theta1 + theta2) + 400*dq*dtheta1*cos(theta1 + theta2)*sin(theta1 + theta2)*cos(theta1) + 200*dtheta1*dtheta2*cos(theta1 + theta2)*sin(theta1 + theta2)*cos(theta2))/(800*(cos(theta1 + theta2)^2 + 2*cos(theta1)^2 + 6*cos(theta2)^2 - 2*cos(theta1 + theta2)*cos(theta1)*cos(theta2) - 12));
% dx(6) = -(23544*sin(theta1 + theta2) - 23544*cos(theta2)*sin(theta1) - 3924*sin(theta1 + theta2)*cos(theta1)^2 - 20*u*cos(theta1 + theta2) - 5886*sin(theta1 + theta2)*cos(theta2) + 20*u*cos(theta1)*cos(theta2) - 200*dtheta2^2*cos(theta1 + theta2)*sin(theta1 + theta2) + 981*cos(theta1 + theta2)*sin(theta1 + theta2)*cos(theta1) - 800*dtheta1^2*cos(theta1 + theta2)*sin(theta1) + 3924*cos(theta1 + theta2)*cos(theta1)*sin(theta1) - 1200*dtheta2^2*cos(theta2)*sin(theta2) + 2400*dq*dtheta1*sin(theta1 + theta2) - 400*dq*dtheta1*sin(theta1 + theta2)*cos(theta1)^2 + 200*dtheta2^2*cos(theta1 + theta2)*cos(theta1)*sin(theta2) + 200*dtheta2^2*sin(theta1 + theta2)*cos(theta1)*cos(theta2) - 200*dtheta1*dtheta2*cos(theta1 + theta2)*sin(theta1 + theta2) + 800*dtheta1^2*cos(theta1)*cos(theta2)*sin(theta1) + 600*dq*dtheta2*sin(theta1 + theta2)*cos(theta2) - 100*dq*dtheta2*cos(theta1 + theta2)*sin(theta1 + theta2)*cos(theta1) + 200*dtheta1*dtheta2*sin(theta1 + theta2)*cos(theta1)*cos(theta2))/(200*(cos(theta1 + theta2)^2 + 2*cos(theta1)^2 + 6*cos(theta2)^2 - 2*cos(theta1 + theta2)*cos(theta1)*cos(theta2) - 12));

% Simplified
dx(4) = -(30*u - (2943*sin(2*theta1 + theta2))/4 - 1962*sin(2*theta1) + (981*sin(2*theta1 + 3*theta2))/4 - 981*sin(theta2) + 1200*dtheta1^2*sin(theta1) - 10*u*cos(2*theta2) - 200*dtheta1^2*sin(theta1 - 2*theta2) - 200*dtheta1^2*sin(theta1 + 2*theta2) + 100*dtheta2^2*sin(theta1 - theta2) + 100*dtheta2^2*sin(theta1 + theta2) + 100*dq*dtheta2*sin(theta2) + 75*dq*dtheta2*sin(2*theta1 + theta2) - 50*dtheta1*dtheta2*sin(theta1 - theta2) - 50*dtheta1*dtheta2*sin(theta1 + 3*theta2) + 100*dq*dtheta1*sin(2*theta1) + 100*dq*dtheta1*sin(2*theta2) - 100*dq*dtheta1*sin(2*theta1 + 2*theta2) - 25*dq*dtheta2*sin(2*theta1 + 3*theta2) + 300*dtheta1*dtheta2*sin(theta1 + theta2))/(200*(cos(2*theta1) + 5*cos(2*theta2) - 16));
dx(5) = (9810*sin(theta1 + 2*theta2) + (981*sin(3*theta1 + 3*theta2))/4 - (46107*sin(theta1 + theta2))/4 - 33354*sin(theta1) - 2100*dtheta2^2*sin(theta2) + 100*dtheta2^2*sin(2*theta1 + theta2) + 600*dtheta1^2*sin(2*theta1) + 200*dtheta1^2*sin(2*theta2) - 200*dtheta1^2*sin(2*theta1 + 2*theta2) + 30*u*cos(theta1) - 10*u*cos(theta1 + 2*theta2) + 1200*dq*dtheta1*sin(theta1) + 200*dtheta1*dtheta2*sin(theta2) + 1100*dq*dtheta1*sin(theta1 + 2*theta2) + 150*dtheta1*dtheta2*sin(2*theta1 + theta2) - 100*dq*dtheta1*sin(3*theta1 + 2*theta2) - 25*dq*dtheta2*sin(3*theta1 + 3*theta2) - 50*dtheta1*dtheta2*sin(2*theta1 + 3*theta2) + 1175*dq*dtheta2*sin(theta1 + theta2))/(400*(cos(2*theta1) + 5*cos(2*theta2) - 16));
dx(6) = -((981*sin(3*theta1 + 2*theta2))/4 - (10791*sin(theta1 + 2*theta2))/4 - 9810*sin(theta1 - theta2) + 9810*sin(theta1 + theta2) - 2943*sin(theta1) + 400*dtheta1^2*sin(theta2) - 200*dtheta1^2*sin(2*theta1 + theta2) - 500*dtheta2^2*sin(2*theta2) - 10*u*cos(theta1 + theta2) + 200*dtheta1^2*sin(2*theta1 - theta2) + 10*u*cos(theta1 - theta2) + 300*dq*dtheta2*sin(theta1) + 100*dq*dtheta1*sin(theta1 - theta2) - 100*dq*dtheta1*sin(3*theta1 + theta2) + 275*dq*dtheta2*sin(theta1 + 2*theta2) + 50*dtheta1*dtheta2*sin(2*theta1) + 50*dtheta1*dtheta2*sin(2*theta2) - 25*dq*dtheta2*sin(3*theta1 + 2*theta2) - 50*dtheta1*dtheta2*sin(2*theta1 + 2*theta2) + 2200*dq*dtheta1*sin(theta1 + theta2))/(100*(cos(2*theta1) + 5*cos(2*theta2) - 16));

% Observer part
y = [q;
    q + L1 * sin(theta1);
    q + L1 * sin(theta1) + L2*sin(theta1+theta2)]

x_hat_dot = (A - L*C) * x_hat + B * u + L * y;
dx (7:12) = x_hat_dot;
end
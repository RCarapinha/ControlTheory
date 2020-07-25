%2nd Part

clear all
close all
clc

initT3

%--1--
%Observable Eigenvalues
detectability_hautus(A1,C1)
detectability_hautus(A2,C2);
detectability_hautus(A3,C3);
detectability_hautus(A4,C4);
detectability_hautus(A5,C5);
detectability_hautus(A6,C6);
detectability_hautus(A7,C7);
detectability_hautus(A8,C8);
detectability_hautus(A9,C9);

%--2--
%Eigenvalues
[e1,e2,e3,e4,e5,e6,e7,e8] = Se_eigen_value();

%--3--
unobservable_system(A1,B1,C1)
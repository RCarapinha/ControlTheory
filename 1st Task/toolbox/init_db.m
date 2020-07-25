%Clear everything
clear all; 
close all;
clc

%Add folders to search path
currentFolder = pwd; 
addpath(currentFolder);

%Declare variables as global
global database; 
global A;
global B;
global impulse_signal;
global signal_name;
global time;

%Initialize variables
database=[]; 
A=[];
B=[];
impulse_signal = [];
signal_name = [];
time = 0;
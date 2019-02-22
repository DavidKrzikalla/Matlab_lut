%% Adaptive integration
% This file serves as a input file for adaptive integration function.
clc

f=@(x)x.^2; %function for integration
a=0; %lower limit
b=2; %upper limit 
eps=1e-10; %allowed error

[I, error]=adaptive_integration(f, a, b, eps);
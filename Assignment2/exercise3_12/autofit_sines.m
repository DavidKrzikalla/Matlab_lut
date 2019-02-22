%% Autofit of sines
% This file serves as a main file for running of each individual function

clc

N=3; %number of coefficients
M=100; % number of divisions withing integration (trapezoids)
filename_f = 'Graph with function f';
filename_g = 'Graph with function g';

f=@(t) (1/pi).*t; % function for approximation
g=@(t) exp(-(t-pi)); % function for approximation - task h

[b_N]=integrate_coeffs(f, N, M); % task c, e
for i=1:length(b_N) %displaying of coefficients
    fprintf(['Coefficient b',num2str(i),' is %.4f \n'],b_N(i))
end

[b_N_test]=test_integrate_coeffs(f, N, M); % task d
plot_approx(f, N, M, filename_f) % task f, g

disp('Press Enter to continue')
pause

plot_approx(g, N, M, filename_g) % task h

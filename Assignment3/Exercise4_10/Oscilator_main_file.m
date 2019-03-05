%% This is a main file to run functions calculating behavior and energy of the system by both Forward Euler Method and Euler-Cromer method.

clc
% System parameters
k=50; % spring stiffness [N/m]
m=10; % mass [kg]
omega=sqrt(k/m); % natural frequency

%Initial conditions
x_0=2; % initial displacement [m]
v_0=0; % initial velocity [m/s]

[u_FE, v_FE, t] = osc_FE(omega, x_0, v_0);
osc_energy(u_FE, v_FE, omega, t, 'Forward Euler'); % plotting of energy using forward euler

[u_EC, v_EC, t] = osc_EC(omega, x_0, v_0);
osc_energy(u_EC, v_EC, omega, t, 'Euler-Cromer'); % plotting of energy using euler-cromer
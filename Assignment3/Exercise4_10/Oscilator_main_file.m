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
E_sum = osc_energy(u_FE, v_FE, omega, t, 'Forward Euler');

[u_BE, v_BE, t] = osc_BE(omega, x_0, v_0);
E_sum = osc_energy(u_BE, v_BE, omega, t, 'Euler-Cromer');

% figure %disp plot FE
%     plot(t,u_FE,'--b')
%     hold on
%     plot(t,x_0*cos(omega*t),'--r')
%     xlabel('Time t [s]')
%     ylabel('disp')
%     title('disp - FE')
%     
% figure % desp plor BE
%     plot(t,u_BE,'--b')
%     hold on
%     plot(t,x_0*cos(omega*t),'--r')
%     xlabel('Time t [s]')
%     ylabel('disp')
%     title('disp - BE')
%% This is a main file to run functions calculating behavior of the oscillating system by Backward Euler Method.

clc
close all

% System parameters
k=50; % spring stiffness [N/m]
m=10; % mass [kg]
omega=sqrt(k/m); % natural frequency

%Initial conditions
x_0=2; % initial displacement [m]
v_0=0; % initial velocity [m/s]

[u, v, t] = osc_BE(omega, x_0, v_0); % computing of diplacements and velocities
osc_energy(u, v, omega, t, 'Backward Euler'); % plotting of energy using forward euler

figure %plotting displacement
plot(t,u,'b')
hold on
plot(t,x_0*cos(omega*t),'--r')    
xlabel('Time [s]')
ylabel('Displacement [m]')
title('Displacement progress')
legend({'Calucated','Exact'},'Location','northwest')
    
figure %plotting velocity
plot(t,v,'b')
hold on
plot(t,-x_0*omega*sin(omega*t),'--r')
xlabel('Time [s]')
ylabel('veloity [m/s]')
title('Velocity progress')
legend({'Calucated','Exact'},'Location','northwest')
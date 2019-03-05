%This function serves to calculate displacement u and velocity v 
%of oscilating undamped mass - 1 DOF
%Method used is Euler-Cromer

%Input parameters:
% omega - natural frequency
% x_0 - initial displacement
% v_0 - initial velocity

function [u, v, t] = osc_EC(omega, x_0, v_0)

    P=2*pi/omega; % time period
    dt=P/20; % time step
    T=P*3; % final time

    N_t = floor(T/dt); % number of time points
    t=linspace(0,N_t*dt,N_t+1); % time array

    u = zeros(N_t+1, 1);
    v = zeros(N_t+1, 1); 

    %Initial conditions
    u(1)=x_0;
    v(1)=v_0;
    for n = 1:N_t
        v(n+1) = v(n) - dt*omega^2*u(n); % solving the velocity
        u(n+1) = u(n) + dt*v(n+1); % solving the displacement
    end
end
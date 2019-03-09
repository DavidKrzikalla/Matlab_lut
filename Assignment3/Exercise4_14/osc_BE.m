%This function serves to calculate displacement u and velocity v 
%of oscilating undamped mass - 1 DOF
%Method used is Backward Euler

%Input parameters:
% omega - natural frequency
% x_0 - initial displacement
% v_0 - initial velocity

function [u, v, t] = osc_BE(omega, x_0, v_0)

    P=2*pi/omega; % time period
    dt=P/2000; % time step
    T=P*3; % final time

    N_t = floor(T/dt); % number of time points
    t=linspace(0,N_t*dt,N_t); % time array

    u = zeros(N_t, 1);
    v = zeros(N_t, 1); 

    %Initial conditions
    u(1)=x_0;
    v(1)=v_0;
    for n = 2:N_t
        v(n) = (v(n-1)-dt*omega^2*u(n-1))/(1+dt^2*omega^2); % solving the velocity
        u(n) = u(n-1)+dt*v(n); % solving the displacement
    end
end
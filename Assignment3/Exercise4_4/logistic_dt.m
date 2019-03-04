%% Exercise 4.4
% This script solve numericaly ODE (Forward Euler method) within given timespan using iterative halving of time step.

%Input variables:
% dt - initial time step 
% T - end time
% U_0 - initial condition

%Input variables depending on the ODE:
% f - time function
% r - Growth function coefficient
% M - Fixing growth function coefficient

clc

dt=input('Insert initial time step\n'); % initial time step 
T=input('Insert end time\n'); % end time step
U_0=input('Insert initial condition\n'); % initial condition

r=0.1; %parameter of the growth function
M=600; %parameter of the growth function
f=@(t,u)r*(1-(u/M))*u; % growth function

k=0; %halving coefficient

dtk=2^(-k)*dt; % halving of time step    
[t, u] = ode_FE(f, dtk, T, U_0); %solving of ode
plot(t, u,'-b');
hold on

k=1;
while true
    dtk=2^(-k)*dt; % halving of time step
    fprintf('New time step: %.4f\n', dtk)
    
    [t, u] = ode_FE(f, dtk, T, U_0); %solving of ode
    plot(t, u,'-r');
    legend('Last step','New step');
    hold off
    
    decision=input('To continue, insert 1 \nTo exit insert 0 \n');
    if decision~=1
        break
    else 
        k=k+1;
        t_last=t;
        u_last=u;
        plot(t_last, u_last,'-b');
        hold on
        continue
    end
end
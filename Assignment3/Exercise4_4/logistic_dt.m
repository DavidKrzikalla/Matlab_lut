dt=25; % time step 
T=60; % end step

k=1:3; %halving coefficient
dtk=2.^(-k)*dt; % halving of time step

U_0=100; % initial condition
r=0.1; %parameter of the growth function
M=600; %parameter of the growth function
f=@(t,u)r*(1-(u/M))*u; % growth function
for i=k
    [t, u] = ode_FE(f, dtk(i), T, U_0); %solving of ode
    plot(t, u);
    xlabel('t'); ylabel('N(t)');
    hold on
end

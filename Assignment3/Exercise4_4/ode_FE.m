function [t, u] = ode_FE(f, dt, T, U_0)
    N_t = floor(T/dt);
    u = zeros(N_t+1, 1);
    t = linspace(0, N_t*dt, length(u))';
    u(1) = U_0; 
    for n = 1:N_t
        u(n+1) = u(n) + dt*f(t(n), u(n));
    end
end
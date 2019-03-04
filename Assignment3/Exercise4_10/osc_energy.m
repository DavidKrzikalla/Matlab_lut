% This function serves to calculate potential, kinetic and total energy of
% the oscilating system.

%Input parameters:
% u - displacements 
% v - velocities
% omega - natural frequency
% name - name of calculation method for plotting purposes

function E_sum = osc_energy(u, v, omega, t, name)

    E_potential=0.5*omega^2*u.^2;
    E_kinetic=0.5*v.^2;
    
    E_sum = zeros(length(E_potential),1);
    E_sum(1) = E_potential(1)+E_kinetic(1);
    
    for i=1:length(E_potential)-1 % total energy calculation
        E_sum(i+1) = E_potential(i+1)+E_kinetic(i+1);
    end
    
    figure
    plot(t,E_potential,'--b')
    hold on
    plot(t,E_kinetic,'--r')
    plot(t,E_sum,'-k')
    xlabel('Time t [s]')
    ylabel('Energy')
    title(['Total Energy Time Development - ',name,'.'])
    legend({'Potential Energy','Kinetic Energy','Total Energy'},'Location','northwest')
end
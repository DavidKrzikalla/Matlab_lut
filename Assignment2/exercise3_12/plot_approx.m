% This function plots approximation function S_N(t) 
%  together with approximated function f(t).
% The time array is from -pi to pi.

%Inputs:
%f - function for approximation
%M - number of divisions of time interval and trapezoids
%N - number of coefficients b_N

function plot_approx(f, N, M, filename) 
    t=linspace(-pi, pi, M);
    [b_N]=integrate_coeffs(f, N, M);
    [S_N]=sinesum(t, b_N);
   
    plot(t, f(t));
    hold on
    plot(t, S_N);    
    xlabel('Time interval')
    ylabel('Function values')
    title('Comparison of original and approximation function')
    grid off
    legend({'Original function','Approximation function'},'Location','northwest')
    print(filename, '-deps');
    hold off
end
% Use Newton-Raphson’s method to solve systems of nonlinear algebraic equations.
function [x, iteration_counter] = NR_method(F, J, x, tol, max_iterations)
% Solve nonlinear system F=0 by Newton-Raphson’s method.
% J is the Jacobian of F. Both F and J must be functions of x.
% At input, x holds the start value. The iteration continues
% until ||F|| < tol (tolerance). 
%The procedure works once the number of iterations is smaller than
%max_iterations.
F_value = F(x);
F_norm = norm(F_value); % L2 norm of vector
iteration_counter = 0;
while F_norm > tol && iteration_counter < max_iterations
    delta = J(x)\-F_value;
    x = x + delta;
    F_value = F(x);
    F_norm = norm(F_value);
    iteration_counter = iteration_counter + 1;
end
% Here, either a solution is found, or too many iterations
if F_norm > tol
    iteration_counter = -1;
end
end
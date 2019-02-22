%This function serves for computation of b_N coefficients. 
%Trapeziodal division 'elements' are used. 
%Input parameters are:
%f - function for approximation
%M - number of divisions (trapezoids)
%N - number of coefficients b_N

function [b_N]=integrate_coeffs(f, N, M)
    b_N=zeros(1,N);
    for i=1:N       
        g=@(t) f(t)*sin(i.*t);
        I=trapezoidal(g, -pi, pi, M);
        b_N(1,i)=(1/pi)*I;
    end
end
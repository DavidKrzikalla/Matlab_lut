%This function serves for testing of computation of b_N coefficients. 
%Trapeziodal method is used. 
%Input parameters are:
%f - function for approximation
%M - number of divisions (trapezoids)
%N - number of coefficients b_N

%The result of this test should be zero coefficients for arbitrary M.
%Results confirmed this property, i.e. no change of results when M is changed.

function [b_Ntest]=test_integrate_coeffs(f, N, M)
    b_Ntest=zeros(1,N);
    for i=1:N       
        g=@(t) sin(i.*t);
        I=trapezoidal(g, -pi, pi, M);
        b_Ntest(1,i)=(1/pi)*I;
    end
end
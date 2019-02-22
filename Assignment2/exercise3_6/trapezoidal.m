%This function serves for numerical integration. 
%Trapeziodal division 'elements' are used. 
%Input parameters are:
%f - function for integration
%a - lower limit
%b - upper limit
%n - number of divisions (trapezoids)

function I=trapezoidal(f, a, b, n)
    h=(b-a)/n;
    I=h*(f(a)+f(b))/2;
    
    for i=a+h:h:b-h
        I=I+h*f(i);
    end
end
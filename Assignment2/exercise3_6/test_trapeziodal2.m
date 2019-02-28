%% Test of the trapezoidal integration function
%Testing unit of trapezoidal function with linear function for which the solution should be exact

f=@(x)(6.*x-4); % original linear function for integration
a=1.2; %lower limit
b=4.4; %upper limit
n=1; %number of divisions
F=@(x)(3.*x.^2-4.*x); %funtion anti-derivative

expected=F(b)-F(a);
I=trapezoidal(f, a, b, n);
tol=eps*1e2; %original precision
diff=abs(expected-I);
assert(diff<=tol, 'Integration error larger than tolerance. Error: %g, Tol: %g',diff, tol);
%% Test of trapezoidal for linear function with big numbers

f=@(x)(6e8.*x-4e6); % original linear function for integration
a=1.2; %lower limit
b=4.4; %upper limit
n=1; %number of divisions
F=@(x)(3e8.*x.^2-4e6.*x); %funtion anti-derivative

expected=F(b)-F(a);
I=trapezoidal(f, a, b, n);
tol=eps*1e10; %precision lowered due to big numbers 
diff=abs(expected-I);
assert(diff<=tol, 'Integration error larger than tolerance. Error: %g, Tol: %g',diff, tol);
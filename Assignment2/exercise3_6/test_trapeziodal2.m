%% Test of the trapezoidal integration function
%Testing unit of trapezoidal function with linear function for which the solution should be exact

f=@(x)(6.*x-4); % original linear function for integration
a=1.2; %lower limit
b=4.4; %upper limit
n=1; %number of divisions
F=@(x)(3.*x.^2-4.*x); %funtion anti-derivative

expected=F(b)-F(a);
I=trapezoidal(f, a, b, n);
tol=1e-14; %original precision
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
tol=1e-6; %precision lowered due to big numbers 
diff=abs(expected-I);
assert(diff<=tol, 'Integration error larger than tolerance. Error: %g, Tol: %g',diff, tol);

%Conclusion

%Changing the original function to the function with high numbers cause the
%test to fail. The fail of the test is caused the most likely by tolerance
%setting to be very tight for such big numbers. The solution is that the
%tolerance is set not so tight, say 1e-6. Then the test is completed
%succesfully. Because the aim of this test was to check prescribed matlab
%function for integration, using linear function there is no dependence on
%division number and the results should be calculated exactly.
%Since the tests were passed the matlab function could be considered as
%right.
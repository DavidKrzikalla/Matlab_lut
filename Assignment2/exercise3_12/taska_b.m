%% Script solving symbolicaly task a, b
clc

syms t b N

f=(1/pi)*t; % original function
SN=b*sin(N*t); % approximation function
E=int((SN-f)^2, -pi, pi); %error function
parcial=diff(E,b); %partial derivation of E with respect to b

B=solve(parcial, b); % solving b from partial derivative
BN= @(N) B;

N=3; %number of coefficients
b=zeros(N,1);
for i=1:N
    b(i,1)=double(subs(BN,i));
end

disp(b)
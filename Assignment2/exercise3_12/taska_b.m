%% Script solving symbolicaly task a, b
clc

syms t b N

f=(1/pi)*t;
SN=b*sin(N*t);
E=int((SN-f)^2, -pi, pi);
parcial=diff(E,b);

B=solve(parcial, b)
BN= @(N) B;
N=3;
for i=1:N
    BN1=double(subs(BN,i))
end
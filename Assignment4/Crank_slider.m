%% This script serves for calculation of kinematics of crank slider.
% The non-linear equation solving method is Newton-Raphson. 

clc
close all

% Input data [SI units]:
a=0.1;
b=0.2;
t=linspace(0,20,200);
omega=1;

phi=(pi/6)+omega.*t; %anti-clockwise rotation

x_i=[0;0;0;0;0;0]; %initial guess
tol=1e-5; % tolerance

%setting of result matrices
x=zeros(6,length(t));
iterations=zeros(1,length(t));

for i=1:length(t)

% Vector of equations:
F=@(u) [a*cos(phi(i))+b*cos(u(1))-u(2);
        a*sin(phi(i))-b*sin(u(1));
        -a*sin(phi(i))*omega-b*sin(u(1))*u(3)-u(4);
        a*cos(phi(i))*omega-b*cos(u(1))*u(3);
        -a*cos(phi(i))*omega^2-b*cos(u(1))*(u(3))^2-b*sin(u(1))*u(5)-u(6);
        -a*sin(phi(i))*omega^2+b*sin(u(1))*(u(3))^2-b*cos(u(1))*u(5)];

% Jacobian:
J=@(u) [-b*sin(u(1)) -1     0               0      0        0;
        -b*cos(u(1))  0     0               0      0        0;
        -b*sin(u(1))  0 -b*sin(u(1))       -1      0        0;
        -b*cos(u(1))  0 -b*cos(u(1))        0      0        0;
        -b*sin(u(1))  0 -2*b*cos(u(1))*u(3) 0 -b*sin(u(1)) -1;
        -b*cos(u(1))  0 -2*b*sin(u(1))*u(3) 0 -b*cos(u(1))  0];

[x(:,i),iterations(:,i)] = NR_method(F, J, x_i, tol,100); %solving function
end

% piston kinematics plot
figure 
subplot(2,1,1);
plot(t,x(2,:))
hold on
plot(t,x(4,:))
plot(t,x(6,:))
fplot(0,[0,t(i)],'--k')
title('Piston kinematics','Interpreter','latex')
xlabel('Time [s]','Interpreter','latex')
legend('Displacement - d [m]','Velocity - $\dot d$ [m/s]',...
    'Acceleration - $\ddot d [m/s^2]$','Interpreter','latex')

% rod kinematics plot
subplot(2,1,2)
plot(t,x(1,:))
hold on
plot(t,x(3,:))
plot(t,x(5,:))
fplot(0,[0,t(i)],'--k')
title('Rod kinematics','Interpreter','latex')
xlabel('Time [s]','Interpreter','latex')
legend('Angle - $\theta$ [rad]','Angular Velocity - $\dot \theta$ [rad/s]',...
    'Angular Acceleration - $\ddot \theta [rad/s^2]$','Interpreter','latex')

%Iterations histogram
figure
histogram(iterations)
xlim([min(iterations)-3 max(iterations)+3])
xtickformat('%g')
title('Iterations histogram','Interpreter','latex')
xlabel('Number of iterations','Interpreter','latex')
ylabel('Frequency','Interpreter','latex')
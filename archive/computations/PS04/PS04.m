clear;clc;

T_Fin   = 4;
k       = 0.005;
N       = T_Fin/k;
Time    = linspace(0,T_Fin,N+1);
t       = 0.0;
u_o     = 1.5;
u       = zeros(3,N+1);
u(:,1)  = u_o;
lambda  = -10^(6);

for i = 1:N
    u(1, i+1)   = BackwardEuler(u(1,i), t, k, lambda);   
    u(2, i+1)   = Trapezoidal(  u(2,i), t, k, lambda);
    t           = t + k;
end
    u(3,:)      =   exp(lambda*Time).*(u_o-cos(0.0))+cos(Time);
    abs(u(1:2,end)-u(3,end))
figure(1)
plot(Time,u(1,:),'-or',Time,u(3,:),'-k')

figure(2)
plot(Time,u(2,:),'-or',Time,u(3,:),'-k')
clear;
clc;
T = 900;

[U235]  = material_kinetics(T,'U235');
rho     = @(t) 0.1*U235.beta;
s       = @(t) 0;
t_final = 30;
t_short = linspace(0,t_final,1000);
u_o     = zeros(2,1);
u_o(2)  = 1;
u_o(1)  = (U235.beta*u_o(2))/U235.lambda.inv;
sol_inv = ode15s(@(t,u) onegroupkinetics(t,u,U235,rho,s,'inv'),[0 t_final],u_o);
u_o(1)  = (U235.beta*u_o(2))/U235.lambda.ave;
sol_ave = ode15s(@(t,u) onegroupkinetics(t,u,U235,rho,s,'ave'),[0 t_final],u_o);
u_o     = zeros(7,1);
u_o(7)  = 1;
u_o(1:6)= (U235.beta_k*u_o(7))./U235.lambda_k;
sol_six = ode15s(@(t,u) sixgroupkinetics(t, u, U235, rho, s),[0 t_final],u_o);
P_inv   = deval(sol_inv,t_short);
P_ave   = deval(sol_ave,t_short);
P_six   = deval(sol_six,t_short);
figure(1)
plot(t_short,P_inv(2,:),t_short,P_ave(2,:),t_short,P_six(7,:))
title('Problem 2')
xlabel('time [s]')
ylabel('power [-]')
legend('Inverse Decay Constant','Average Decay Constant','Six Group',0)
% 2
t_final = 120;
sol_asy = ode15s(@(t,u) sixgroupkinetics(t, u, U235, rho, s),[0 t_final],u_o);
t_long  = linspace(0,t_final,120000); 
P_asy   = deval(sol_asy,t_long);
z       = polyfit(t_long,log(P_asy(7,:)),1);
alpha   = z(1);
rho_six = @(t) alpha*(U235.Lambda+sum(U235.beta_k./(alpha+U235.lambda_k)));
rho_inv = @(t) alpha*(U235.Lambda+U235.beta/(alpha+U235.lambda.inv));
rho_ave = @(t) alpha*(U235.Lambda+U235.beta/(alpha+U235.lambda.ave));
rho_six_o = rho_six(0);
rho_inv_o = rho_inv(0);
rho_ave_o = rho_ave(0);
rho_ana = rho(0);
sol_six = ode15s(@(t,u) sixgroupkinetics(t, u, U235, rho_six, s),[0 t_final],u_o);
u_o     = zeros(2,1);
u_o(2)  = 1;
u_o(1)  = (U235.beta*u_o(2))/U235.lambda.inv;
sol_inv = ode15s(@(t,u) onegroupkinetics(t,u,U235,rho_inv,s,'inv'),[0 t_final],u_o);
u_o(1)  = (U235.beta*u_o(2))/U235.lambda.ave;
sol_ave = ode15s(@(t,u) onegroupkinetics(t,u,U235,rho_ave,s,'ave'),[0 t_final],u_o);
P_inv   = deval(sol_inv,t_long);
P_ave   = deval(sol_ave,t_long);
P_six   = deval(sol_six,t_long);
figure(2)
plot(t_long,P_inv(2,:),t_long,P_ave(2,:),t_long,P_six(7,:),t_long,P_asy(7,:))
title('Problem 1')
legend('Inverse Decay Constant','Average Decay Constant','Six Group','Data',0)
xlabel('time [s]')
ylabel('power [-]')
j = [1000*t_long' 412*P_asy(7,:)'];
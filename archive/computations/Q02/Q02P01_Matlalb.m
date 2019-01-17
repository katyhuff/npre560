% Lewis John Lloyd
% NE555: Nuclear Reactor Dynamics
% Quiz 02
% Problem 01
clc;clear;

run materials;

N_Fuel = 1000;
N_Gap  = 100;
N_Clad = 100;
N      = N_Fuel+N_Gap+N_Clad;

dr_Fuel = R_Fuel/N_Fuel;
dr_Gap = t_Gap/N_Gap;
dr_Clad = t_Clad/N_Clad;

r = zeros(N+1,1);
dr = zeros(N,1);
dr(1:N_Fuel) = dr_Fuel;
dr(N_Fuel+1:N_Fuel+N_Gap)= dr_Gap;
dr(N_Fuel+N_Gap+1:N) = dr_Clad;

for i =1:N_Fuel+1;
    r(i) = dr_Fuel*(i-1);
end
for i =1:N_Gap;
    r(N_Fuel+1+i) = r(N_Fuel+i)+dr_Gap;
end
for i =1:N_Clad;
    r(N_Fuel+1+N_Gap+i) = r(N_Fuel+N_Gap+i)+dr_Clad;
end


N = 1000;
T = zeros(N,1);



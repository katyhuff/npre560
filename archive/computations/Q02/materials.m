D_Fuel      = 0.0093;
D_Clad      = 0.0107;
R_Fuel      = 0.5*D_Fuel;
t_Clad      = 0.00062;
t_Gap       = 0.5*(D_Clad-(D_Fuel+2.0*t_Clad));
R_Gap       = R_Fuel+t_Gap;
R_Clad      = R_Gap+t_Clad;
P2D         = 1.32;
P_Wetted    = pi*D_Clad;
A_Flow      = D_Clad^2*(P2D^2-0.25*pi);
D_Hydraulic = 4*A_Flow/P_Wetted;

k_UO2   = 3.0;
c_U02   = 325;
rho_U02 = 10970;

k_He    = 0.25;
c_He    = 5182;
rho_He  = 12.24;

k_Zr    = 17.0;
c_Zr    = 320.9;
rho_Zr  = 6534;

k_H2O   = 0.5101;
c_H2O   = 5997;
rho_H2O = 688.6;
mu_H2O  = 0.00008187;
Pr_H2O  = 0.9625;
T_H2O   = 590;
V_H2O   = 2.472;

m_dot   = rho_H2O*A_Flow*V_H2O;
Re      = (rho_H2O*V_H2O*D_Hydraulic)/mu_H2O;
Nu      = 0.023*Pr_H2O^(0.4)*Re^(0.8);
h_H20   = (Nu*k_H2O)/D_Hydraulic;



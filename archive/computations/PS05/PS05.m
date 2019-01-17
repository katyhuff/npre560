clc;clear;

% Lewis John Lloyd
% Problem Set 05
% 04APR2011

% Fuel Rod Geometry
diam_f      = 0.0093;                               % [m]
radius_fuel = 0.5*diam_f;                           % [m]
t_clad      = 0.00062;                              % [m]
diam_clad   = 0.0107;                               % [m]
t_gap        = 0.5*(diam_clad-(diam_f+2*t_clad));    % [m]

% Fuel Rod Material Properties
k_f         = 2.0;    % [W/m-K]
k_He        = 0.25; % [W/m-K]
k_clad      = 17.0;   % [W/m-K]

% Core Properties
q_o = 300*10^(6);                           % [W/m^3]
q   = @(r) q_o*(1+0.12*(r/radius_fuel)^2);  % [W/m^3]

% Coolant Properties
Pressure    = 15.5*10^(6);  % [Pa]
T_bulk      = 590;          % [K]
u_ave       = 2.472;        % [m/s]

% Coolant Properties From EES
k_h2o       = 0.5101;       % [W/m-K]
c_h2o       = 5997;         % [J/kg-K]
rho_h2o     = 688.6;        % [kg/m^3]
Pr_h2o      = 0.9625;       % [-]
mu_h2o      = 0.00008187;   % [kg/m-s]

% Flow Channel Geometry
P2D         = 1.32;         % [-]

% Calcuated Values
P_wetted    = pi*diam_clad;                 % [m]

A_flow      = diam_clad^2*(P2D^2-pi/4);     % [m^2]
D_h         = diam_clad*((4/pi)*P2D^2-1);   % [m]
m_dot       = rho_h2o*A_flow*u_ave;         % [kg/s]
Re          = (rho_h2o*u_ave*D_h)/mu_h2o;   % [-]
Nu          = (0.023)*Pr_h2o^(0.4)*Re^(0.8);% [-]
h_h2o       = (Nu*k_h2o)/D_h;               % [W/m^2-K]






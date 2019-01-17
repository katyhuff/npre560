%   NE555: Nuclear Reactor Dynamics
%   Spring 2011
%   University of Wisconsin - Madison
%   

clear; clc;
%--------------------------------------------------------------------------
%   Problem 04

k = 0:0.001:0.999;
M_l = 1./(1-k);
figure(1)
plot(k,M_l,'-r')
axis([0 2 0 100])
title('$$\frac{M}{\textit{l}}$$ vs. k','Interpreter','latex')
ylabel('$$\frac{M}{\textit{l}}$$','Interpreter','latex')
xlabel('$$k$$','Interpreter','latex')


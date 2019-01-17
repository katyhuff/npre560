function [v_ave v_inv] = average_vel(T)
k           = 1.3806504*10^(-23);
m_n         = 1.67492729*10^(-27);
MaxVel      = @(vel,Temp) (m_n^2*vel.^3)./(2*k^2*Temp^2).*exp(-m_n*vel.^2./(2*k*Temp));
v_inv       = 1/quad(@(v) ((1./v).*MaxVel(v,T)),0,10000);
v_ave       = quad(@(v) (v.*MaxVel(v,T)),0,300000);
end
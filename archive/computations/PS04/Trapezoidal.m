function RHS = Trapezoidal(u,t,k,lambda)
    z = lambda*k;
    RHS = u*(1+0.5*z)/(1-0.5*z)-...
        (k/(2.0-z))*(lambda*(cos(t+k)+cos(t))+sin(t+k)+sin(t));
end
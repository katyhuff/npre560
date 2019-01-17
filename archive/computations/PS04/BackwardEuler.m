function RHS = BackwardEuler(u,t,k,lambda)
    z   = lambda*k;
    a   = 1/(1-z);
    RHS =  a*(u-z*cos(t+k)-k*sin(t+k));
end
function RHS = ForwardEuler(u,t,k,lambda)
    RHS = u + k*(lambda*(u-cos(t))-sin(t)); 
end
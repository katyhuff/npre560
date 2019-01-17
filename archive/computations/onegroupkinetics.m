function dudt = onegroupkinetics(t, u, p, rho,s,decay)
Lambda      = p.Lambda;
beta        = p.beta;
switch decay
    case 'inv'
        lambda = p.lambda.inv;
    case 'ave'
        lambda = p.lambda.ave;
    otherwise
        disp('Error - OneGroupKinetics.m - invalid decay option.')
end
dudt = zeros(2,1);
%One Effective Precursor
dudt(1) = -lambda*u(1)+beta*u(2);
%Power
dudt(2) = ((rho(t)-beta)/Lambda)*u(2)+(lambda*u(1))/Lambda+s(t)/Lambda;
end

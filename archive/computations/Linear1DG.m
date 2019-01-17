function dudt = Linear1DG(t, u, p, rho, s, decay)
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
%Power
dudt(1) =   (rho(t) /Lambda)        - ...
            (beta   /Lambda)*u(1)   + ...
            (lambda /Lambda)*u(2)   + ...
            (s(t)   /Lambda);
%One Effective Precursor
dudt(2) =   beta    * u(1) - ...
            lambda  * u(2);
end

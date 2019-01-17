function dudt = sixgroupkinetics(t, u, p, rho,s)
Lambda      = p.Lambda;
lambda_k    = p.lambda_k;
beta        = p.beta;
beta_k      = p.beta_k;
dudt = zeros(7,1);
%Precursor 1
dudt(1) = -lambda_k(1)*u(1)+beta_k(1)*u(7);
%Precursor 2
dudt(2) = -lambda_k(2)*u(2)+beta_k(2)*u(7);
%Precursor 3
dudt(3) = -lambda_k(3)*u(3)+beta_k(3)*u(7);
%Precursor 4
dudt(4) = -lambda_k(4)*u(4)+beta_k(4)*u(7);
%Precursor 5
dudt(5) = -lambda_k(5)*u(5)+beta_k(5)*u(7);
%Precursor 6
dudt(6) = -lambda_k(6)*u(6)+beta_k(6)*u(7);
%Power
dudt(7) = ((rho(t)-beta)/Lambda)*u(7)+1/Lambda*sum(lambda_k.*u(1:6))+s(t)/Lambda;
end

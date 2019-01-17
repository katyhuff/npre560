y_t = inline('4/3*exp(-0.8*t)-1/3*exp(-0.2*t)','t');
x_t = inline('2/3*(exp(-0.8*t)-exp(-0.2*t))','t');

t = linspace(0,50,1000);

y = y_t(t);
x = x_t(t);

figure(1)
plot(t,y,t,x)
title('Question 4: Plot of y(t) and x(t) vs. t.')
axis([0 50 -0.5 1])
legend('y(t)','x(t)',0)
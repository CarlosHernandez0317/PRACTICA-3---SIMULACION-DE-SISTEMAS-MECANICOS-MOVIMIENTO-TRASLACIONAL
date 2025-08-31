    function dx = P3(t, x, m1, m2, b1, k1, k2, f, z)
    
    dx = zeros(4,1);
    dx(1) = x(2);
    dx(2) = (-b1 * (x(2) - x(4)) + k1 * (-x(1) + x(3)) + f) / m1;
    dx(3) = x(4);
    dx(4) = (b1 * (x(2) - x(4)) + k1 * x(1) - (k1 + k2) * x(3) - f + k2 * z(t)) / m2;
end

m1 = 290;
b1 = 1000;
m2 = 59; 
k1 = 16182;
f = 0;
k2 = 19000;

x0 = [0; 0; 0; 0];
z1 = @(t) 0.05 * sin(0.5 * pi * t); 
z2 = @(t) 0.05 * sin(20 * pi * t);  

[t, x] = ode45(@(t,x) P3(t, x, m1, m2, b1, k1, k2, f, z1), [0 10], x0);
figure;
subplot(2,1,1);
plot(t, x(:,1));
hold on;
plot(t, x(:,3));
xlabel('Tiempo (s)');
ylabel('Desplazamiento');
legend('x1', 'x2');
title('Sistema de suspensión - z1');
grid on;

[t, x] = ode45(@(t,x) P3(t, x, m1, m2, b1, k1, k2, f, z2), [0 10], x0);
subplot(2,1,2);
plot(t, x(:,1));
hold on;
plot(t, x(:,3));
xlabel('Tiempo (s)');
ylabel('Desplazamiento');
legend('x1', 'x2');
title('Sistema de suspensión - z2');
grid on;
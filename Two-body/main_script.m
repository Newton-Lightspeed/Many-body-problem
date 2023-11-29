% Define initial conditions and time span
r0 = 100; % Initial separation
p_r0 = -0.0001; % Initial radial momentum
theta0 = 0.9; % Initial angle
p_theta0 = 0.9; % Initial angular momentum (This is an assumption, you might need to adjust)
x00 = [r0, p_r0, theta0, p_theta0];

t_span = [0 100]; % Adjust as needed

mu = 1; % Reduced mass

% Set options for the ODE solver
options = odeset('AbsTol', 1e-8, 'RelTol', 1e-6);

% Solve the ODEs using ode113 solver
[t, x] = ode45(@(t, x) numerical_sol(t, x, mu), t_span, x0, options);

% Plot r against time
figure;clf;
subplot(3, 1, 1);
plot(t, x(:, 1));
xlabel('Time');
ylabel('r');
title('Evolution of r over Time');

% Plot theta against time
subplot(3, 1, 2);
plot(t, x(:, 3));
xlabel('Time');
ylabel('\theta');
title('Evolution of \theta over Time');

% Compute the energy over time
V_eff = -1./x(:,1).^4 + x(:,4).^2./(2*mu*x(:,1).^2);
E_t = 0.5 * mu * x(:,2).^2 + V_eff;

% Plot energy against time
subplot(3, 1, 3);
plot(t, E_t);
xlabel('Time');
ylabel('Energy');
title('Evolution of Energy over Time');

% Define initial conditions and time span
r12_0 = 100; % Initial separation between particle 1 and 2
r23_0 = 100; % Initial separation between particle 2 and 3
r31_0 = 100; % Initial separation between particle 3 and 1

pr12_0 = -0.0001; % Initial radial momentum for r12
pr23_0 = -0.0001; % Initial radial momentum for r23
pr31_0 = -0.0001; % Initial radial momentum for r31

x0 = [r12_0, r23_0, r31_0, pr12_0, pr23_0, pr31_0];

t_span = [0 100]; % Adjust as needed

% Set options for the ODE solver
options = odeset('AbsTol', 1e-8, 'RelTol', 1e-6);

% Masses of the particles
m1 = 1; % Mass of particle 1
m2 = 1; % Mass of particle 2
m3 = 1; % Mass of particle 3

% Solve the ODEs using ode45 solver
[t, x] = ode45(@(t, x) numerical_sol(t, x, m1, m2, m3), t_span, x0, options);

% Plot the separations against time
figure; clf;
subplot(3, 1, 1);
plot(t, x(:, 1));
xlabel('Time');
ylabel('r_{12}');
title('Separation between Particle 1 and 2');

subplot(3, 1, 2);
plot(t, x(:, 2));
xlabel('Time');
ylabel('r_{23}');
title('Separation between Particle 2 and 3');

subplot(3, 1, 3);
plot(t, x(:, 3));
xlabel('Time');
ylabel('r_{31}');
title('Separation between Particle 3 and 1');

% Energy computation will need to be updated to include kinetic and potential energy
% for all three particles and their interactions.

% After solving the ODEs, compute the total energy

% Compute the kinetic energy for each pair
K12 = x(:, 4).^2 / (2*m1); % Kinetic energy of particle 1 due to motion relative to particle 2
K23 = x(:, 5).^2 / (2*m2); % Kinetic energy of particle 2 due to motion relative to particle 3
K31 = x(:, 6).^2 / (2*m3); % Kinetic energy of particle 3 due to motion relative to particle 1

% Compute the potential energy
V = -1./x(:, 1).^2 - 1./x(:, 2).^2 - 1./x(:, 3).^2; % Assuming a 1/r^2 potential

% Total energy of the system is the sum of kinetic and potential energy
E_total = K12 + K23 + K31 + V;

% Plot the total energy against time
figure;
plot(t, E_total);
xlabel('Time');
ylabel('Total Energy');
title('Total Energy of the System over Time');


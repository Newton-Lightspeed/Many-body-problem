function dev_x = numerical_sol_3bp_3D(t, x, m1, m2, m3)
    % Unpack the state vector
    % Positions and momenta for each particle in 3D
    r1 = x(1:3);
    v1 = x(4:6);
    r2 = x(7:9);
    v2 = x(10:12);
    r3 = x(13:15);
    v3 = x(16:18);
    
    % Compute relative position vectors
    r12 = r2 - r1;
    r23 = r3 - r2;
    r31 = r1 - r3;
    
    % Compute the forces based on your potential, this is just a placeholder
    % You will need to replace this with the actual force law, which might
    % be gravitational, electrical, etc.
    F12 = compute_force(r12, m1, m2);
    F23 = compute_force(r23, m2, m3);
    F31 = compute_force(r31, m3, m1);
    
    % Compute the accelerations
    a1 = F12 / m1 - F31 / m1;
    a2 = F23 / m2 - F12 / m2;
    a3 = F31 / m3 - F23 / m3;
    
    % Pack the time derivatives into the derivative vector
    dev_x = [v1; a1; v2; a2; v3; a3];
end

function F = compute_force(r, m_i, m_j)
    % Placeholder for force magnitude - replace with your potential's force law
    % For gravitational, for example: F = -G * m_i * m_j * r / norm(r)^3;
    G = 6.67430e-11; % Gravitational constant
    F = -G * m_i * m_j * r / norm(r)^3;
end

function dev_x = numerical_sol(~, x, mu)
    r = x(1);
    p_r = x(2);
    theta = x(3);
    p_theta = x(4);

    V = -1/r^4+1000/r^8;
    H_r = p_r/mu;
    H_pr = -4/r^5 + p_theta^2/(mu*r^3)+8*1000/r^9;
    H_theta = p_theta/(mu*r^2);
    H_ptheta = 0; % There's no explicit dependence of H on theta.

    dev_x = [H_r; H_pr; H_theta; H_ptheta];
end

function sys = ode(t,y)
    r = 12;
    A = 14;
    beta = 20;
    B = 4;
    b = 4;
    c = 1.6;
    M = y(1);
    V = y(2);
    dM =  r.*M.*(1 - (M./A)) - beta.*M.*V./(M+B);
    dV = b.*V.*M./(M+B) - c.*V;
    sys = [dM;dV];
end
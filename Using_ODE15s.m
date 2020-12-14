clear all; close all;



t1 = linspace(1,20,10);
t2 = linspace(1,20, 10);
initial_conditions = combvec(t1, t2);

% plot(initial_conditions(1,:), initial_conditions(2,:), 'k.')

timespan = [0 1000];
[t,yv] = ode15s(@sys, timespan, [initial_conditions(1,1), initial_conditions(2,1)]);





% Run this code after SUS_ODE to plot graphs.

close all;
for A=1:14
    figure;
    hold on;
    plot(squeeze(tracker2_2(A,1,1:40000)), 'r');
    plot(squeeze(tracker2_2(A,2,1:40000)), 'r--');
    plot(squeeze(tracker6_6(A,1,1:40000)), 'g');
    plot(squeeze(tracker6_6(A,2,1:40000)), 'g--');
    plot(squeeze(tracker20_20(A,1,1:40000)), 'b');
    plot(squeeze(tracker20_20(A,2,1:40000)), 'b--');
end
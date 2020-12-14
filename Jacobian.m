% Conditions provided by the project.
r = 12;
%A = 14;
beta = 20;
B = 4;
b = 4;
c = 1.6;
for A = 1:14
    M = c*B/(b-c); % 8/3 if the constants haven't changed
    V = r*b*B/(beta*(b-c)) - r*c*b*B^2/((b-c)^2*A*beta); % Depends on A!
    %A
    %V
    J = [r - 2*r*M/A - beta*V/(M+B) + beta*M*V/(M+B)^2, -beta*M/(M+B);
    b*B/(M+B) - b*V*M/(M+B)^2, b*M/(M+B) - c];    
    [eig_vec,eig_val] = eig(J);
    disp(strcat("When A is ", num2str(A),", (M,V) is ", num2str(M),", ", num2str(V)));
    disp(strcat("The eigenvalues are ", num2str(eig_val(1,1)), " and ", num2str(eig_val(2,2))));
    disp(" ");
    
end



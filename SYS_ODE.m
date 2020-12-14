clear all; close all;

% Allocate a reasonably small enough step size.
step_size = .001;
% Allocate a large enough step count to simulate long-term behavior.
numSteps = 100000;

% Conditions provided by the project.
r = 12;
%A = 14;
beta = 20;
B = 4;
b = 4;
c = 1.6;


% Create a 2D-grid of initial values frim 2<M<20 and 2<V<20.
% Since the values area never supposed to drop below 1 (million),
% it wouldn't make much sesne to go beyond that. 
t1 = linspace(2,20,10);
t2 = linspace(2,20, 10);
% The initial conditions are meshed so all possible combinations are
% together here (essentially a 2D grid of initial points).
initial_conditions = combvec(t1, t2);


% A grid to store if, for each pair of initial conditions, the condition lead to a  
% scenerio where M or V go below 1 (million) for each A from 1 to 14.
IC_less_than_1M = zeros(14, length(initial_conditions));

% Trackers to provide insight on changes of M and V with respect to time.
tracker2_2 = zeros(14,2,numSteps); % initial_conditions(:,1)
tracker6_6 = zeros(14,2,numSteps); % initial_conditions(:,23)
tracker20_20 = zeros(14,2,numSteps); % initial_conditions(:,100)



for A = 1:14
    
    % System of ODE as provided in the project
    dM = @(M,V) r.*M.*(1-M./A) - beta.*M.*V./(M+B);
    dV =@(M,V) b.*V.*M./(M+B) - c.*V;
    % Reset the initial conditions.
    initial_conditions = combvec(t1, t2);
    

    for i = 1:numSteps
        
        % Take a step.
        initial_conditions(1,:) = initial_conditions(1,:) + dM(initial_conditions(1,:), initial_conditions(2,:))*step_size;
        initial_conditions(2,:) = initial_conditions(2,:) + dV(initial_conditions(1,:), initial_conditions(2,:))*step_size;
        
        tracker2_2(A,:,i) = initial_conditions(:,1);
        tracker6_6(A,:,i) = initial_conditions(:,23); 
        tracker20_20(A,:,i) = initial_conditions(:,100); 
        
        % Store if the initial condition ever goes below 1 (million) for
        % each initial condition pair. 
        IC_less_than_1M(A,:) = or(IC_less_than_1M(A,:), or(initial_conditions(1,:)<=1, initial_conditions(2,:)<=1));
        %if mod(i,100000) == 0
            
        %    hold on;
         %   initial_conditions(1,1)
        %    plot(initial_conditions(1,1), initial_conditions(2,1), 'k.')
        %end
    end
    disp(strcat("A equals ",  num2str(A)," causes ", num2str(sum(IC_less_than_1M(A,:))), " of the 100 initial condition cases to drop below 1 million at some point."));
end

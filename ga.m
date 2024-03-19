% Clear the command window, clear all variables, and close all figures
clc;
clear;
close all;

nVar = 25;               % Number of decision variables (length of the binary string)
VarSize = [1 nVar];      % Size of decision variables (1 row, nVar columns)

%% GA Parameters
maxGen = 100;             % Maximum number of iterations
N = 100;                     % Population size

% enforcing N to be even if N is odd as the crossover is done pairWise
if ~mod(N,2)==0
    N = N + 1;
end


 
% Crossover parameters
pc = 0.8;                       % Crossover percentage

% Mutation parameters
pm = 0.02;               % Mutation probability/rate

%% Initialization
% Initialize structure for an individual
empty_individual.Position = [];
empty_individual.Cost = [];

% Create initial population array
Ppar = repmat(empty_individual, N, 1);

for i = 1:N
    % Initialize position with random binary string
    Ppar(i).Position = randi([0 1], VarSize);
    % Evaluate initial population
    Ppar(i).Cost = CostFunction(Ppar(i).Position);
end

% Sort population based on cost
[~, SortOrder] = sort([Ppar.Cost]);
Ppar = Ppar(SortOrder);

BestSol = Ppar(1);          % Store best solution found
BestCost = zeros(maxGen, 1);% Array to hold best cost values at each iteration
BestCost(1) = BestSol.Cost;




%% Main Loop
for t = 1:maxGen
   
    % TournamentSelection
    par_sel_indices = TournamentSelection_Binary(Ppar); %-->N

    Pm = repmat(empty_individual, N, 1); % --> N
    Pm = Ppar(par_sel_indices);
 
    % Crossover: single point crossover
    Pint = repmat(empty_individual, N, 1); %--> N
    
    for k = 1:2:N-1

        p1 = Pm(k,1);
        p2 = Pm(k+1,1);
        
        r = rand(); % generate uniformly distributed numbers between [0,1]

        if(r <= pc) % do crossover
            [Pint(k,1).Position, Pint(k+1,1).Position] = SinglePointCrossover(p1.Position, p2.Position);
            % Evaluate intermediate pop offsprings Pint
            Pint(k,1).Cost = CostFunction(Pint(k,1).Position);
            Pint(k+1,1).Cost = CostFunction(Pint(k+1,1).Position);
        else
            Pint(k,1).Position = p1.Position;
            Pint(k+1,1).Position = p2.Position;
            % Evaluate intermediate pop offsprings
            Pint(k,1).Cost = CostFunction(Pint(k,1).Position);
            Pint(k+1,1).Cost = CostFunction(Pint(k+1,1).Position);
        end
         
    end
    
    Poff = Pint;
    
    % Mutation

    for k = 1:N
        % Select parent for mutation
        p = Poff(k,1);

        for j=1:nVar
            if(rand() < pm)
                p.Position(j) = 1 - p.Position(j);
            end
        end
        
        % calculating the code only if any of the genes has mutated
        p.Cost = CostFunction(p.Position);
        Poff(k,1) = p;

    end
        
    % Merge populations (current, crossover offsprings, and mutants)
    Ppar = [Ppar; Poff];

    % Sort merged population and select the best
    [~, SortOrder] = sort([Ppar.Cost]);
    Ppar = Ppar(SortOrder);
    
    % Keep only the best individuals

    Ppar = Ppar(1:N);
    
    % Update best solution found
    BestSol = Ppar(1);
    
    % Store best cost in current iteration
    BestCost(t+1) = BestSol.Cost;
    
    % Display iteration information
    disp(['Iteration ' num2str(t) ': Best Cost = ' num2str(BestCost(t))]);
    
end
    
    


%% Results
% Plot best cost per iteration
figure;
plot(BestCost, 'LineWidth', 2);
xlabel('Iteration');
ylabel('Cost');
grid on;

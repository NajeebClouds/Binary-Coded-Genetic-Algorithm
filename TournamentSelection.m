function i = TournamentSelection_m(pop, m)
    % TournamentSelection Performs tournament selection from a population with binary string positions
    %
    % This function selects an individual from the population 'pop' using tournament
    % selection, where 'm' individuals are randomly chosen, and the one with the best
    % (lowest) 'Cost' is selected. It assumes individuals' positions are represented as binary strings.
    %
    % Inputs:
    %   pop - Population array of structs, each with 'Position' (binary string) and 'Cost' fields.
    %   m - Tournament size, the number of individuals to compete in the tournament.
    %
    % Output:
    %   i - Index of the selected individual within 'pop'.
    %
    % Example:
    %   % Initialize a sample population with binary string positions
      % nPop = 10; % Population size
      % pop = repmat(struct('Position', [], 'Cost', []), nPop, 1);
      % for i = 1:nPop
      %     pop(i).Position = round(rand(1, 10)); % Generate a binary string (vector of 0s and 1s)
      %     pop(i).Cost = sum(pop(i).Position); % Example cost calculation
      % end
      % m = 3; % Tournament size
      % selectedIndex = TournamentSelection(pop, m);
      % disp(['Selected Individual Index: ', num2str(selectedIndex)]);
      % disp(['Selected Individual Cost: ', num2str(pop(selectedIndex).Cost)]);

    % Get the total number of individuals in the population
    nPop = numel(pop);

    % Randomly select 'm' individuals for the tournament
    S = randsample(nPop, m);

    % Extract the costs of the selected individuals
    scosts = [pop(S).Cost];
    
    % Find the individual with the lowest cost
    [~, j] = min(scosts);
    
    % Return the index of the selected individual in the original population
    i = S(j);
end

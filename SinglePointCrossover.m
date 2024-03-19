function [y1, y2] = SinglePointCrossover(x1, x2)
    % SinglePointCrossover Performs a single-point crossover between two parent solutions
    %
    % This function takes two parent solutions, x1 and x2, and performs a single-point
    % crossover operation to produce two offspring solutions, y1 and y2. A crossover point
    % is randomly selected, and the genes (elements) before this point are swapped between
    % the two parents to create the offspring.
    %
    % Inputs:
    %   x1 - First parent solution (array or binary string)
    %   x2 - Second parent solution (array or binary string of the same length as x1)
    %
    % Outputs:
    %   y1 - First offspring solution
    %   y2 - Second offspring solution
    %
    % Example:
      % parent1 = [1, 0, 1, 0, 1, 0];
      % parent2 = [0, 1, 0, 1, 0, 1];
      % [offspring1, offspring2] = SinglePointCrossover(parent1, parent2);
      % disp(offspring1);
      % disp(offspring2);

    % Determine the number of variables (length) of the input solutions
    nVar = numel(x1);

    % Randomly select a crossover point (excluding the last position to ensure exchange)
    c = randi([1, nVar-1]);

    % Create the first offspring by combining the genes from x1 up to the crossover point
    % with the genes from x2 after the crossover point
    y1 = [x1(1:c), x2(c+1:end)];

    % Create the second offspring by combining the genes from x2 up to the crossover point
    % with the genes from x1 after the crossover point
    y2 = [x2(1:c), x1(c+1:end)];
end

function winners_indices = TournamentSelection_Binary(pop)
    % TournamentSelection_Binary performs a binary tournament selection on a population
    % for genetic algorithms, selecting individuals based on their fitness.
    %
    % Inputs:
    %   pop - An array of structures representing the population. Each element in the
    %         array is expected to have at least a 'Cost' field, which represents the
    %         fitness of the individual. Lower 'Cost' values indicate better fitness.
    %
    % Outputs:
    %   winners_indices - An array of indices representing the winners of the tournaments.
    %                     Each index corresponds to an individual in the input population
    %                     array 'pop'. The size of 'winners_indices' is equal to the size
    %                     of the input population, allowing for a winner from each tournament
    %                     to be selected for the next generation.

    % Get the total number of individuals in the population
    nPop = numel(pop); % Counts the number of elements in the population array 'pop'
    
    % Initializes an array to store indices of winners, with the same size as the population but filled with zeros
    winners_indices = zeros(nPop,1); 
    
    % Generates a random permutation of indices from 1 to nPop, effectively shuffling the population indices
    shuffled_pop_indices = randperm(nPop); 

    % Loop through the shuffled population indices, comparing pairs of individuals
    for i=1:nPop-1
        % Compare the 'Cost' of two consecutive individuals in the shuffled list
        % If the cost of the first individual is less than or equal to the second,
        % then the first individual wins and its index is stored
        if(pop(shuffled_pop_indices(i)).Cost <= pop(shuffled_pop_indices(i+1)).Cost)
            winners_indices(i) = shuffled_pop_indices(i);
        else
            % If the second individual's cost is lower, it wins and its index is stored
            winners_indices(i) = shuffled_pop_indices(i+1);
        end
    end

    % Special case for wrapping around: compare the first and the last individual
    % in the shuffled list to determine the final winner
    if(pop(shuffled_pop_indices(1)).Cost <= pop(shuffled_pop_indices(end)).Cost)
        winners_indices(end) = shuffled_pop_indices(1); % First individual wins
    else
        winners_indices(end) = shuffled_pop_indices(end); % Last individual wins
    end
end

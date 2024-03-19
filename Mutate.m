function y = Mutate_m(x, mu)
    % Mutate_m Performs mutation on a binary string.
    %
    % This function takes a binary string (array) 'x' and a mutation rate 'mu' to
    % perform mutation. The mutation rate determines the fraction of bits in the
    % string that will be flipped.
    %
    % Inputs:
    %   x - A binary string (array) representing the individual/solution to mutate.
    %   mu - The mutation rate, a value between 0 and 1, representing the fraction
    %        of the string's bits to be mutated.
    %
    % Output:
    %   y - The mutated binary string.
    %
    % Example:
      % x = [1, 0, 1, 0, 1, 0]; % Original binary string
      % mu = 0.5; % Mutation rate (50% of the bits will be flipped)
      % y = Mutate_m(x, mu); % Perform mutation
      % disp(['Original string: ', num2str(x)]);
      % disp(['Mutated string: ', num2str(y)]);

    % Determine the total number of variables (bits) in the binary string
    nVar = numel(x);
    
    % Calculate the number of mutations based on the mutation rate
    nmu = ceil(mu * nVar); % Use ceil to ensure at least one bit is mutated if mu > 0
    
    % Randomly select 'nmu' distinct positions to mutate
    j = randsample(nVar, nmu);
    
    % Copy the original string to 'y'
    y = x;
    
    % Perform the mutation by flipping the selected bits
    y(j) = 1 - x(j);
end

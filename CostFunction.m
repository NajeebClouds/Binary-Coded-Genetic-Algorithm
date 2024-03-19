function z = CostFunction(x)
    % MinOne Calculates the total number of ones in a binary string.
    %
    % This function takes a binary string 'x' as input and returns the sum of its
    % elements. In the context of genetic algorithms or optimization problems, this
    % sum represents the total number of ones in the binary string. The function
    % can be used as part of a fitness evaluation where the goal might be to minimize
    % or maximize the number of ones.
    %
    % Input:
    %   x - A binary string (array), where each element is either 0 or 1.
    %
    % Output:
    %   z - The total number of ones in the binary string.
    %
    % Example:
    %   x = [1, 0, 1, 1, 0, 1]; % Example binary string
    %   z = MinOne(x); % Calculate the number of ones
    %   disp(['Total number of ones: ', num2str(z)]);

    % Calculate the sum of the binary string elements, which equals the number of ones
    z = sum(x);
end

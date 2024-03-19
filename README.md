# Genetic Algorithm for Optimization in MATLAB

This MATLAB script implements a basic Genetic Algorithm (GA) to solve basic optimization problem (**single objective**). The GA operates by creating a population of potential solutions, represented as binary strings, and iteratively improving them through genetic operations like crossover and mutation.

## Key Features

- **Binary Representation:** The script uses a binary string to represent each candidate solution.
- **Population Size Adjustment:** Ensures the population size (N) is even for pairwise crossover.
- **Selection:** Implements tournament selection to choose parents for the next generation.
- **Crossover:** Employs single-point crossover with a defined crossover rate (`pc`).
- **Mutation:** Applies mutation with a specified mutation probability (`pm`).
- **Cost Evaluation:** Evaluates each candidate using a `CostFunction`, which needs to be defined separately.
- **Convergence Tracking:** Tracks and plots the best cost value across generations.

## Usage

1. **Define the Cost Function:** Implement the `CostFunction` that evaluates the fitness of a candidate solution. The function should take a binary string as input and return a cost value.

2. **Configure GA Parameters:** Set the GA parameters such as the number of variables (`nVar`), population size (`N`), maximum generations (`maxGen`), crossover rate (`pc`), and mutation rate (`pm`).

3. **Run the Script:** Execute the script in MATLAB. It initializes a population, applies genetic operations, and evolves the population for a specified number of generations.

4. **View Results:** The script displays the best cost value at each iteration and plots the convergence of the best cost over time.

## Script Structure

- **Initialization:** Sets up the GA by initializing the population and evaluating the initial candidates.
- **Main Loop:** Runs the GA operations for a set number of generations. Each iteration involves selection, crossover, mutation, and the generation of a new population.
- **Results:** At the end of the GA run, the script plots the best cost found in each iteration, showing the algorithm's progress.

## Note

- The script assumes that a `CostFunction` is defined elsewhere in the environment. This function should be tailored to the specific optimization problem you're addressing.
- The script includes a visualization (plot) of the algorithm's performance over iterations, which helps in assessing the convergence.

## Conclusion

This MATLAB script provides a foundational implementation of a Genetic Algorithm for optimization problems. Users can adapt the script to their specific problems by modifying the cost function and tuning the GA parameters.

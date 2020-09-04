# Least squares and Normal equations

## About the implementation
1. This folder contains the file "model_fitting.cpp" that reads the data mentioned in the "83ppl.csv" file and tries to find a suitable model to fit this data.

2. The "model_fitting.cpp" script uses the open source Eigen package for matrix manipulation, and generates txt files containing data that can be plotted using any tool like gnu-plot, matplotlib, etc. These txt files are located in the "output_data" folder.

3. Five different models are applied for fitting the same data. This sample data can be found in the "input_data" folder.

4. Result plots were generated using the output data in matlab, the plotting script can be found in the "plotting_script" folder

## Result plots
The resulting fit obtained from each of the 5 models is as shown below:

### Linear fit:
![Linear fit](https://github.com/shorane/cpp_tracking_filtering_estimation/blob/master/Least_squares_and_normal_equations/Result_plots/linear_plot.png)

## Best fit
The results show that the best models for fitting the data are the logarithmic model, linear model and the inverse model.

## Same implementation in Matlab
The same implementation has also been done in matlab and the corresponding matlab script can be found in the /matlab folder.

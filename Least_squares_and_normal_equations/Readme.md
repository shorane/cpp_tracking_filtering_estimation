# Least squares and Normal equations

## About the implementation
1. This folder contains the file [model_fitting.cpp](model_fitting.cpp) that reads the data mentioned in the [83ppl.csv](/input_data/83ppl.csv) file and tries to find a suitable model to fit this data.

2. The theoretical explanation of implementing least squares using normal equations can be found on [this page](https://math.mit.edu/classes/18.085/summer2016/handouts/LeastSquares.pdf)

3. The [model_fitting.cpp](model_fitting.cpp) script uses the open source [Eigen package](http://eigen.tuxfamily.org/index.php?title=Main_Page) for matrix manipulation, and generates txt files containing data that can be plotted using any tool like gnu-plot, matplotlib, etc. These txt files are located in the [output_data](/output_data) folder.

4. Five different models are applied for fitting the same data. This sample data can be found in the [input_data](/input_data) folder.

5. Result plots were generated using the output data in matlab, the plotting script can be found in the [plotting_script](/plotting_script) folder

## Result plots
The resulting fit obtained from each of the 5 models is as shown below:

### Linear fit:
<img src="https://github.com/shorane/cpp_tracking_filtering_estimation/blob/master/Least_squares_and_normal_equations/Result_plots/linear_plot.png" height="300"/>

### Exponential fit:
<img src="https://github.com/shorane/cpp_tracking_filtering_estimation/blob/master/Least_squares_and_normal_equations/Result_plots/Exp_plot.png" height="300"/>

### Exponential fit 2:
<img src = "https://github.com/shorane/cpp_tracking_filtering_estimation/blob/master/Least_squares_and_normal_equations/Result_plots/x_Exp_plot.png" height="300"/>

### Logarithmic fit:
<img src="https://github.com/shorane/cpp_tracking_filtering_estimation/blob/master/Least_squares_and_normal_equations/Result_plots/log_plot.png"  height="300"/>

### Inverse fit: 
<img src="https://github.com/shorane/cpp_tracking_filtering_estimation/blob/master/Least_squares_and_normal_equations/Result_plots/inv_plot.png" height="300"/>

## Best fit
The results show that the best models for fitting the data are the logarithmic model, linear model and the inverse model.

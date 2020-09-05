# Non linear regression

## About the implementation
1. This folder contains the file [NonLinearRegression.cpp](NonLinearRegression.cpp) that reads the data mentioned in one of the dataset files located in the [input_datasets](/input_datasets/) folder and tries to fit the model y = ln(ax) to the data, by iteratively determining a suitable value for a. 


2. More details about non-linear regression can be found [here]().

3. The c++ script uses the open source [Eigen package](http://eigen.tuxfamily.org/index.php?title=Main_Page) for matrix manipulation, and generates txt files containing data that can be plotted using any tool like gnu-plot, matplotlib, etc. These txt files are located in the [result_data](https://github.com/shorane/cpp_tracking_filtering_estimation/tree/master/Non_linear_regression/result_data) folder.

4. It can be observed that depending on the input data and the initial guess for the value of 'a', the process behaves in a different manner and tries to find the local minima for the value of 'a'. The value obtained can vary severely depending on the initial guess applied.

5. Result plots were generated using the output data in matlab, the plotting script can be found in the [plotting_script](https://github.com/shorane/cpp_tracking_filtering_estimation/tree/master/Non_linear_regression/plotting_script) folder

## Result plots
The resulting fit obtained from each of the 3 datasets is as shown below: (plot images can also be found in the [result_images folder](https://github.com/shorane/cpp_tracking_filtering_estimation/tree/master/Non_linear_regression/result_images))

### Dataset A:
<img src="https://github.com/shorane/cpp_tracking_filtering_estimation/blob/master/Non_linear_regression/result_images/A.PNG"/>

### Dataset B:
<img src="https://github.com/shorane/cpp_tracking_filtering_estimation/blob/master/Non_linear_regression/result_images/B.PNG"/>

### Dataset C:
<img src = "https://github.com/shorane/cpp_tracking_filtering_estimation/blob/master/Non_linear_regression/result_images/C.PNG"/>

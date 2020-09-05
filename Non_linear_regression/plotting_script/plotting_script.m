clear all,clc;
cas = "C";
raw_dat_name = 'Data_'+cas+'_lab_2.csv';
fit_file = cas+'_fit.txt';
iter_file = 'iterations_'+cas+'.txt';
fit_plot = cas+'_fit.png';
iter_plot = 'iter_'+cas+'.png';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileID = fopen(raw_dat_name, 'r');
formatSpec = '%f %f ';
sizeA = [2 inf];
dat = fscanf(fileID, formatSpec, sizeA);
fclose(fileID);
y_data = dat(2,:)';
x_data = dat(1,:)';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileID = fopen(fit_file, 'r');
formatSpec = '%f,%f,';
sizeA = [2 inf];
dat = fscanf(fileID, formatSpec, sizeA);
fclose(fileID);
y_fit = dat(2,:)';
x_fit = dat(1,:)';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileID = fopen(iter_file, 'r');
formatSpec = '%f';
sizeA = [1 inf];
iter = fscanf(fileID, formatSpec, sizeA);
iter = iter';
fclose(fileID);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1)
hold on;
plot(x_data , y_data, 'r.');
title("Fitting of Dataset "+cas+" with model y = ln(ax)", 'FontSize',14,'FontWeight','bold');
xlabel("x-data", 'FontSize',14,'FontWeight','bold');
ylabel("y-data",'FontSize',14,'FontWeight','bold');
plot(x_fit,y_fit, 'LineWidth',2);
box on;
hold off;
f1 = figure(1);
saveas(f1,fit_plot);

iter_x = 1:1:size(iter);
figure(2)
hold on;
plot(iter_x , iter);
title("Change in a-value per iteration", 'FontSize',14,'FontWeight','bold');
xlabel("Number of iterations", 'FontSize',14,'FontWeight','bold');
ylabel("Change in a-value",'FontSize',14,'FontWeight','bold');
box on;
hold off;
f2 = figure(2);
saveas(f2,iter_plot);



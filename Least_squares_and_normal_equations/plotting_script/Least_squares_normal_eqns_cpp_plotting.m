clear all,clc;

fileID = fopen('83people-all-meals.txt', 'r');
formatSpec = '%f %f %f %f';
sizeA = [4 inf];
dat = fscanf(fileID, formatSpec, sizeA);
fclose(fileID);
y_data = dat(3,:)';
x_data = dat(4,:)'./dat(3,:)';
%%%%%%%%%%%%%%%%%%%%
%% Log Model Plot

fileID = fopen('log_model.txt', 'r');
formatSpec = '%f,%f,';
sizeA = [2 inf];
dat_fit = fscanf(fileID, formatSpec, sizeA);
fclose(fileID);
%%%%%%%%%%%%%%%%%%%%
x1 = dat_fit(2,:);
y1 = dat_fit(1,:);

figure(1)
hold on;
plot(x_data , y_data, 'r.');
title("Logarithmic fitting (y = alog(x) + b)", 'FontSize',16,'FontWeight','bold');
xlabel("number of kilocalories/bite", 'FontSize',16,'FontWeight','bold');
ylabel("number of bites",'FontSize',16,'FontWeight','bold');
plot(x1,y1, 'LineWidth',2);
box on;
hold off;
f1 = figure(1);
saveas(f1,"log_plot.emf");

%% x-Exp model plot
clear all, clc;

fileID = fopen('83people-all-meals.txt', 'r');
formatSpec = '%f %f %f %f';
sizeA = [4 inf];
dat = fscanf(fileID, formatSpec, sizeA);
fclose(fileID);
y_data = dat(3,:)';
x_data = dat(4,:)'./dat(3,:)';
%%%%%%%%%%%%%%%%%%%%

fileID = fopen('x_exp_model.txt', 'r');
formatSpec = '%f,%f,';
sizeA = [2 inf];
dat_fit = fscanf(fileID, formatSpec, sizeA);
fclose(fileID);
%%%%%%%%%%%%%%%%%%%%
x1 = dat_fit(2,:);
y1 = dat_fit(1,:);

figure(2)
hold on;
plot(x_data , y_data, 'r.');
title("Exponential fitting 2 (y = ax^b)", 'FontSize',16,'FontWeight','bold');
xlabel("number of kilocalories/bite", 'FontSize',16,'FontWeight','bold');
ylabel("number of bites",'FontSize',16,'FontWeight','bold');
plot(x1,y1, 'LineWidth',2);
box on;
hold off;
f2 = figure(2);
saveas(f2,"x_Exp_plot.emf");

%% Exponential model fitting

clear all, clc;

fileID = fopen('83people-all-meals.txt', 'r');
formatSpec = '%f %f %f %f';
sizeA = [4 inf];
dat = fscanf(fileID, formatSpec, sizeA);
fclose(fileID);
y_data = dat(3,:)';
x_data = dat(4,:)'./dat(3,:)';
%%%%%%%%%%%%%%%%%%%%

fileID = fopen('exp_model.txt', 'r');
formatSpec = '%f,%f,';
sizeA = [2 inf];
dat_fit = fscanf(fileID, formatSpec, sizeA);
fclose(fileID);
%%%%%%%%%%%%%%%%%%%%
x1 = dat_fit(2,:);
y1 = dat_fit(1,:);

figure(3)
hold on;
plot(x_data , y_data, 'r.');
title("Exponential fitting (y = ae^{bx})", 'FontSize',16,'FontWeight','bold');
xlabel("number of kilocalories/bite", 'FontSize',16,'FontWeight','bold');
ylabel("number of bites",'FontSize',16,'FontWeight','bold');
plot(x1,y1, 'LineWidth',2);
box on;
hold off;
f3 = figure(3);
saveas(f3,"Exp_plot.emf");

%% Linear fitting

clear all, clc;

fileID = fopen('83people-all-meals.txt', 'r');
formatSpec = '%f %f %f %f';
sizeA = [4 inf];
dat = fscanf(fileID, formatSpec, sizeA);
fclose(fileID);
y_data = dat(3,:)';
x_data = dat(4,:)'./dat(3,:)';
%%%%%%%%%%%%%%%%%%%%

fileID = fopen('linear_model.txt', 'r');
formatSpec = '%f,%f,';
sizeA = [2 inf];
dat_fit = fscanf(fileID, formatSpec, sizeA);
fclose(fileID);
%%%%%%%%%%%%%%%%%%%%
x1 = dat_fit(2,:);
y1 = dat_fit(1,:);

figure(4)
hold on;
plot(x_data , y_data, 'r.');
title("Linear fitting (y = mx + c)", 'FontSize',16,'FontWeight','bold');
xlabel("number of kilocalories/bite", 'FontSize',16,'FontWeight','bold');
ylabel("number of bites",'FontSize',16,'FontWeight','bold');
plot(x1,y1, 'LineWidth',2);
box on;
hold off;
f4 = figure(4);
saveas(f4,"linear_plot.emf");

%% Inverse model fitting:

clear all, clc;

fileID = fopen('83people-all-meals.txt', 'r');
formatSpec = '%f %f %f %f';
sizeA = [4 inf];
dat = fscanf(fileID, formatSpec, sizeA);
fclose(fileID);
y_data = dat(3,:)';
x_data = dat(4,:)'./dat(3,:)';
%%%%%%%%%%%%%%%%%%%%

fileID = fopen('inv_model.txt', 'r');
formatSpec = '%f,%f,';
sizeA = [2 inf];
dat_fit = fscanf(fileID, formatSpec, sizeA);
fclose(fileID);
%%%%%%%%%%%%%%%%%%%%
x1 = dat_fit(2,:);
y1 = dat_fit(1,:);

figure(5)
hold on;
plot(x_data , y_data, 'r.');
title("Inverse model fitting (y = a/x)", 'FontSize',16,'FontWeight','bold');
xlabel("number of kilocalories/bite", 'FontSize',16,'FontWeight','bold');
ylabel("number of bites",'FontSize',16,'FontWeight','bold');
plot(x1,y1, 'LineWidth',2);
box on;
hold off;
f5 = figure(5);
saveas(f5,"inv_plot.emf");
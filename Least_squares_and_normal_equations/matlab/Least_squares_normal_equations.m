%% Part 3 : Linear

clear all, clc;
% Reading file data: 
fileID = fopen('83people-all-meals.txt', 'r');
formatSpec = '%f %f %f %f';
sizeA = [4 inf];
dat = fscanf(fileID, formatSpec, sizeA);
fclose(fileID);
%%%%%%%%%%%%%%%%%%%%
y_data = dat(3,:)';
x_data = dat(4,:)'./dat(3,:)';
figure(3)
hold on;
plot(x_data , y_data, 'r.');
title("Linear fitting (y = mx + c)", 'FontSize',16,'FontWeight','bold');
xlabel("number of kilocalories/bite", 'FontSize',16,'FontWeight','bold');
ylabel("number of bites", 'FontSize',16,'FontWeight','bold');
% 
% Linear fitting:
% 
A = [x_data , ones(size(dat(4,:)))'];
b = y_data;
X = inv(A'*A)*A'*b;
m = X(1);
c = X(2);

residuals = y_data - (m.*x_data + c);
linear_norm = norm(residuals,2);
linear_mean = mean(residuals);
linear_sd = std(residuals);

x1 = 0:1:350;
y1 = m.*x1 + c;
plot(x1,y1,'LineWidth',2);
box on;
hold off;
f3 = figure(3);
saveas(f3,"linear.emf");
m
c

%% Exponential:

clear all,clc;
fileID = fopen('83people-all-meals.txt', 'r');
formatSpec = '%f %f %f %f';
sizeA = [4 inf];
dat = fscanf(fileID, formatSpec, sizeA);
fclose(fileID);
%%%%%%%%%%%%%%%%%%%%

y_data = dat(3,:)';
x_data = dat(4,:)'./dat(3,:)';
figure(4)
hold on;
plot(x_data , y_data, 'r.');
title("Exponential fitting (y = ae^{bx})", 'FontSize',16,'FontWeight','bold');
xlabel("number of kilocalories/bite", 'FontSize',16,'FontWeight','bold');
ylabel("number of bites",'FontSize',16,'FontWeight','bold');



A = [x_data ones(size(dat(4,:)))'];
b = log(y_data);
X = (A'*A)\A'*b;

ae = exp(X(2));
be = X(1);

x1 = 0:1:350;
y1 = ae.*exp(be.*x1);
plot(x1,y1,'LineWidth',2);
box on;
hold off;
f4 = figure(4);
saveas(f4,"exp.emf");

residuals = y_data - (ae.*exp(be.*x_data));
exp_norm = norm(residuals,2);
exp_mean = mean(residuals);
exp_sd = std(residuals);
ae
be

%% Part 3 POW: 

clear all, clc;
% Reading file data: 
fileID = fopen('83people-all-meals.txt', 'r');
formatSpec = '%f %f %f %f';
sizeA = [4 inf];
dat = fscanf(fileID, formatSpec, sizeA);
fclose(fileID);
%%%%%%%%%%%%%%%%%%%%
figure(5)
hold on;
title('Exponential fitting 2 (y = ax^b)', 'FontSize',16,'FontWeight','bold');
y_data = dat(3,:)';
x_data = dat(4,:)'./dat(3,:)';

plot(x_data , y_data, 'r.');
xlabel("number of kilocalories/bite", 'FontSize',16,'FontWeight','bold');
ylabel("number of bites", 'FontSize',16,'FontWeight','bold');

A = [log(x_data) ones(size(dat(4,:)))'];
b = log(y_data);
X = inv(A'*A)*A'*b;

be2 = X(1);
ae2 = exp(X(2));
x1 = 0:1:350;
y1 = ae2 .* x1.^be2;
plot(x1,y1, 'LineWidth',2)
box on;
hold off;
f5 = figure(5);
saveas(f5,"pow.emf");


pow_residuals = y_data - (ae2.* x_data.^be2);
pow_norm = norm(pow_residuals,2);
pow_mean = mean(pow_residuals);
pow_sd = std(pow_residuals);

ae2
be2

%% Part 3 Logarithmic:

clear all, clc;
% Reading file data: 
fileID = fopen('83people-all-meals.txt', 'r');
formatSpec = '%f %f %f %f';
sizeA = [4 inf];
dat = fscanf(fileID, formatSpec, sizeA);
fclose(fileID);
%%%%%%%%%%%%%%%%%%%%
figure(6)
hold on;
title('Logarithmic fitting (y = alog(x) + b)', 'FontSize',16,'FontWeight','bold');
y_data = dat(3,:)';
x_data = dat(4,:)'./dat(3,:)';

plot(x_data , y_data, 'r.');
xlabel("number of kilocalories/bite", 'FontSize',16,'FontWeight','bold');
ylabel("number of bites", 'FontSize',16,'FontWeight','bold');


A = [log(x_data) ones(size(dat(4,:)))'];
b = y_data;
X = inv(A'*A)*A'*b;

be2 = X(2);
ae2 = (X(1));
x1 = 0:1:350;
y1 = ae2.* log(x1) + be2;
plot(x1,y1, 'LineWidth',2);
box on;
hold off;
f6 = figure(6);
saveas(f6,"log.emf");

residuals = y_data - (ae2.*log(x_data) + be2);
log_norm = norm(residuals,2);
log_mean = mean(residuals);
log_sd = std(residuals);

ae2
be2

%% Inverse model fitting
clear all, clc;
% Reading file data: 
fileID = fopen('83people-all-meals.txt', 'r');
formatSpec = '%f %f %f %f';
sizeA = [4 inf];
dat = fscanf(fileID, formatSpec, sizeA);
fclose(fileID);
%%%%%%%%%%%%%%%%%%%%
figure(7)
hold on;
title('Inverse model fitting (y = a/x)', 'FontSize',16,'FontWeight','bold');
y_data = dat(3,:)';
x_data = dat(4,:)'./dat(3,:)';

plot(x_data , y_data, 'r.');
xlabel("number of kilocalories/bite", 'FontSize',16,'FontWeight','bold');
ylabel("number of bites", 'FontSize',16,'FontWeight','bold');


A = [ones(size(dat(4,:)))'];
b = y_data .* x_data;
X = inv(A'*A)*A'*b;

ae2 = (X(1));
x1 = 0:1:350;
y1 = ae2./ x1;
plot(x1,y1, 'LineWidth',2);
box on;
hold off;
f7 = figure(7);
saveas(f7,"log.emf");

residuals = y_data - (ae2./(x_data));
log_norm = norm(residuals,2);
log_mean = mean(residuals);
log_sd = std(residuals);

ae2
be2
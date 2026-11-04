clc;
clear;
close;

// Tin hieu dau vao
x = [1, 2, -3, 2, 1];
h = [1, 0, -1];

nx = 0:4;
nh = 0:2;

// Phuong phap folding and shifting
y1 = convol(x, h);
ny = 0:length(y1)-1;

// Phuong phap ma tran
H = [
  1  0  0  0  0;
  0  1  0  0  0;
 -1  0  1  0  0;
  0 -1  0  1  0;
  0  0 -1  0  1;
  0  0  0 -1  0;
  0  0  0  0 -1
];

y2 = H * x';

// Nang luong tin hieu
Ex = sum(x.^2);
Ey = sum(y1.^2);

disp(y1, "Linear convolution:");
disp(y2', "Matrix method:");
disp(Ex, "Energy of x:");
disp(Ey, "Energy of y:");

// Ve do thi
scf(1);
subplot(3,1,1);
plot2d3(nx, x);
xtitle("Input signal x(n)", "n", "x(n)");
xgrid();

subplot(3,1,2);
plot2d3(ny, y1);
xtitle("Output signal y(n)", "n", "y(n)");
xgrid();

subplot(3,1,3);
bar([Ex, Ey]);
xtitle("Signal energy", "x(n), y(n)", "Energy");

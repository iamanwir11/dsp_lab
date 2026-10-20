clc;
clear;
close;

//Tin hieu goc
n = -4:4;
x = [0, 0, 1, 1, 1, 1, 0.5, 0.5, 0];

//x(n-2)
n1 = -2:6;
y1 = zeros(1, length(n1));
for i = 1:length(n1)
    k = n1(i) - 2;
    if k >= -1 & k <= 2 then
        y1(i) = 1;
    elseif k == 3 | k == 4 then
        y1(i) = 0.5;
    end
end

//x(4-n)
n2 = 0:5;
y2 = [0.5, 0.5, 1, 1, 1, 1];

//x(n+2)
n3 = -3:2;
y3 = [1, 1, 1, 1, 0.5, 0.5];

//x(n)u(2-n)
n4 = -4:4;
y4 = [0, 0, 1, 1, 1, 1, 0, 0, 0];

//x(n-1)delta(n-3)
n5 = 0:6;
y5 = zeros(1, length(n5));
y5(4) = 1;

//x(n^2)
n6 = -2:2;
y6 = [0.5, 1, 1, 1, 0.5];

//Phan chan
n7 = -4:4;
y7 = [0.25, 0.25, 0, 0, 1, 0, 0, 0.25, 0.25];

//Phan le
n8 = -4:4;
y8 = [-0.25, -0.25, 0, 0, 0, 0, 0, 0.25, 0.25];

scf(0);
subplot(4,2,1); plot2d3(n1,y1); xtitle("x(n-2)","n","y1"); xgrid();
subplot(4,2,2); plot2d3(n2,y2); xtitle("x(4-n)","n","y2"); xgrid();
subplot(4,2,3); plot2d3(n3,y3); xtitle("x(n+2)","n","y3"); xgrid();
subplot(4,2,4); plot2d3(n4,y4); xtitle("x(n)u(2-n)","n","y4"); xgrid();
subplot(4,2,5); plot2d3(n5,y5); xtitle("x(n-1)delta(n-3)","n","y5"); xgrid();
subplot(4,2,6); plot2d3(n6,y6); xtitle("x(n^2)","n","y6"); xgrid();
subplot(4,2,7); plot2d3(n7,y7); xtitle("Even part","n","xe"); xgrid();
subplot(4,2,8); plot2d3(n8,y8); xtitle("Odd part","n","xo"); xgrid();

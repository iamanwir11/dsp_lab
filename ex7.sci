clc;
clear;
clf;

x = [1, 1, 2, -3, 2, 1];
h = [1, 1, 0, -1, -1, 1];

N = max(length(x), length(h));

if length(x) < N then
    x = [x, zeros(1, N - length(x))];
end
if length(h) < N then
    h = [h, zeros(1, N - length(h))];
end

// 
y_fold_shift = zeros(1, N);
for n = 0:(N - 1)
    for k = 0:(N - 1)
        idx = pmodulo(n - k, N) + 1; 
        y_fold_shift(n + 1) = y_fold_shift(n + 1) + h(k + 1) * x(idx);
    end
end

disp("Ket qua bang phuong phap Folding and Shifting:");
disp(y_fold_shift);

// pp2
H_circ = zeros(N, N);
for i = 0:(N - 1)
    for j = 0:(N - 1)
        idx = pmodulo(i - j, N) + 1;
        H_circ(i + 1, j + 1) = h(idx);
    end
end

y_matrix = (H_circ * (x'))'; 

disp("Ket qua bang phuong phap Ma tran:");
disp(y_matrix);

//năng 
Ex_instant = abs(x).^2;
Ey_instant = abs(y_fold_shift).^2;

Ex_total = sum(Ex_instant);
Ey_total = sum(Ey_instant);

mprintf("\nTong nang luong tin hieu x: %.4f\n", Ex_total);
mprintf("Tong nang luong tin hieu y: %.4f\n", Ey_total);

// ------------------------------------------
// VẼ ĐỒ THỊ
// ------------------------------------------
n = 0:(N - 1);

// Đồ thị tín hiệu x(n)
subplot(2, 2, 1);
plot2d3(n, x, style=2);
plot(n, x, "r.");
xtitle("Tin hieu x(n)", "n", "x(n)");
xgrid();

// Đồ thị tín hiệu y(n)
subplot(2, 2, 2);
plot2d3(n, y_fold_shift, style=5);
plot(n, y_fold_shift, "m.");
xtitle("Tich chap vong y(n)", "n", "y(n)");
xgrid();

// Đồ thị năng lượng tức thời của x(n)
subplot(2, 2, 3);
plot2d3(n, Ex_instant, style=3);
plot(n, Ex_instant, "g.");
xtitle(msprintf("Nang luong x(n) [Tong = %.2f]", Ex_total), "n", "|x(n)|^2");
xgrid();

// Đồ thị năng lượng tức thời của y(n)
subplot(2, 2, 4);
plot2d3(n, Ey_instant, style=4);
plot(n, Ey_instant, "b.");
xtitle(msprintf("Nang luong y(n) [Tong = %.2f]", Ey_total), "n", "|y(n)|^2");
xgrid();

clc;
clear;
close;

// -------------------------------------------------------------------------
// HÀM 1: Tô màu miền vành khăn (Annular Region: r_in < |z| < r_out)
// -------------------------------------------------------------------------
function draw_annulus(r_in, r_out, fill_color)
    theta = linspace(0, 2*%pi, 200);
    // Nối vòng ngoài (thuận chiều) và vòng trong (ngược chiều) tạo đa giác kín
    x_poly = [r_out * cos(theta), r_in * cos(theta($:-1:1))];
    y_poly = [r_out * sin(theta), r_in * sin(theta($:-1:1))];
    xfpoly(x_poly, y_poly);
    e = gce();
    e.background = fill_color;
    e.foreground = -1; // Không vẽ đường viền nối của đa giác
endfunction

// -------------------------------------------------------------------------
// HÀM 2: Thiết lập khung tọa độ Z-plane chuẩn (tránh đè nhãn lên tâm)
// -------------------------------------------------------------------------
function setup_z_plane(limit_val)
    theta = linspace(0, 2*%pi, 300);
    
    // Vẽ hai trục tọa độ Re(z) và Im(z) đi qua tâm (nét liền xám đen mảnh)
    plot([-limit_val, limit_val], [0, 0], "k-", "LineWidth", 1);
    plot([0, 0], [-limit_val, limit_val], "k-", "LineWidth", 1);
    
    // Vẽ đường tròn đơn vị |z| = 1 làm chuẩn (nét đứt màu đen)
    plot(cos(theta), sin(theta), "k--", "LineWidth", 1.2);
    
    // Đặt nhãn đường tròn đơn vị |z|=1 ở góc xiên để không đè lên trục
    xstring(0.72, 0.72, "|z|=1");
    
    // Cài đặt trục: Đưa nhãn ra biên đồ thị (bottom & left) để tránh đè lên tâm
    ax = gca();
    ax.isoview = "on";
    ax.data_bounds = [-limit_val, -limit_val; limit_val, limit_val];
    ax.box = "on";
    ax.x_location = "bottom";
    ax.y_location = "left";
    xlabel("Re(z)", "fontsize", 2);
    ylabel("Im(z)", "fontsize", 2);
endfunction

// -------------------------------------------------------------------------
// HÀM 3: Đánh dấu điểm cực (Pole) bằng dấu 'x' đỏ và ghi giá trị
// -------------------------------------------------------------------------
function plot_pole(p_real, p_imag, label_str)
    plot(p_real, p_imag, "rx", "MarkerSize", 12, "LineWidth", 2);
    // Ghi nhãn điểm cực hơi lệch lên trên
    xstring(p_real + 0.08, p_imag + 0.08, label_str);
endfunction

// =========================================================================
// KHỞI TẠO CỬA SỔ ĐỒ HỌA
// =========================================================================
f = figure(1);
f.figure_name = "DSP Lab 5 - Problem 3.3: Region of Convergence (ROC)";
f.background = 8; // Nền trắng
theta = linspace(0, 2*%pi, 300);

// =========================================================================
// CÂU (a): x_1(n) = (1/3)^n*u(n) + (1/2)^(-n)*u(-n-1) = (1/3)^n*u(n) + 2^n*u(-n-1)
// Cực: p1 = 1/3 (nhân quả, |z| > 1/3); p2 = 2 (phản nhân quả, |z| < 2)
// ROC: Vành khăn 1/3 < |z| < 2 (chứa đường tròn đơn vị |z| = 1)
// =========================================================================
subplot(2, 2, 1);
r1_a = 1/3;
r2_a = 2.0;
limit_a = 2.6;

// 1. Tô màu miền ROC (vành khăn giữa 1/3 và 2)
draw_annulus(r1_a, r2_a, color(210, 235, 255)); // Màu xanh lam nhạt

// 2. Vẽ 2 đường tròn biên (nét đứt)
plot(r1_a * cos(theta), r1_a * sin(theta), "r--", "LineWidth", 1.5);
plot(r2_a * cos(theta), r2_a * sin(theta), "b--", "LineWidth", 1.5);

// 3. Khung tọa độ và đường tròn đơn vị
setup_z_plane(limit_a);

// 4. Đánh dấu các cực
plot_pole(r1_a, 0, "p_1 = 1/3");
plot_pole(r2_a, 0, "p_2 = 2");

title(["(a) x_1(n) = (1/3)^n u(n) + 2^n u(-n-1)"; ...
       "X_1(z) = (-5/3 z^-1) / [(1 - 1/3 z^-1)(1 - 2z^-1)]"; ...
       "ROC: 1/3 < |z| < 2 (Vanh khan chua |z|=1)"], "fontsize", 2);


// =========================================================================
// CÂU (b): x_2(n) = [(1/3)^n - 2^n]*u(n) (Tín hiệu nhân quả)
// Cực: p1 = 1/3 (|z| > 1/3); p2 = 2 (|z| > 2)
// ROC: Phần ngoài đường tròn cực ngoài cùng: |z| > 2
// =========================================================================
subplot(2, 2, 2);
r_pole1_b = 1/3;
r_pole2_b = 2.0;
limit_b = 3.2;

// 1. Tô màu miền ROC: Từ bán kính cực ngoài r=2.0 ra đến biên đồ thị limit_b
draw_annulus(r_pole2_b, limit_b, color(210, 235, 255));

// 2. Vẽ các đường tròn cực
plot(r_pole1_b * cos(theta), r_pole1_b * sin(theta), "g:", "LineWidth", 1.2);
plot(r_pole2_b * cos(theta), r_pole2_b * sin(theta), "r--", "LineWidth", 1.8);

// 3. Khung tọa độ và đường tròn đơn vị
setup_z_plane(limit_b);

// 4. Đánh dấu các cực
plot_pole(r_pole1_b, 0, "p_1 = 1/3");
plot_pole(r_pole2_b, 0, "p_2 = 2");

title(["(b) x_2(n) = [(1/3)^n - 2^n] u(n) (Nhan qua)"; ...
       "X_2(z) = (-5/3 z^-1) / [(1 - 1/3 z^-1)(1 - 2z^-1)]"; ...
       "ROC: |z| > 2 (Phia ngoai r = 2, khong chua |z|=1)"], "fontsize", 2);


// =========================================================================
// CÂU (c): x_3(n) = x_1(n + 4) (Dịch thời gian sang trái 4 mẫu)
// Tính chất: Z{x(n+k)} = z^k * X(z). Ở đây X_3(z) = z^4 * X_1(z)
// ROC: Giữ nguyên ROC của x_1(n), ROC: 1/3 < |z| < 2
// =========================================================================
subplot(2, 2, 3);
r1_c = 1/3;
r2_c = 2.0;
limit_c = 2.6;

// 1. Tô màu miền ROC (vành khăn giữa 1/3 và 2)
draw_annulus(r1_c, r2_c, color(210, 235, 255));

// 2. Vẽ 2 đường tròn biên
plot(r1_c * cos(theta), r1_c * sin(theta), "r--", "LineWidth", 1.5);
plot(r2_c * cos(theta), r2_c * sin(theta), "b--", "LineWidth", 1.5);

// 3. Khung tọa độ và đường tròn đơn vị
setup_z_plane(limit_c);

// 4. Đánh dấu các cực
plot_pole(r1_c, 0, "p_1 = 1/3");
plot_pole(r2_c, 0, "p_2 = 2");

title(["(c) x_3(n) = x_1(n + 4) (Phep dich thoi gian)"; ...
       "X_3(z) = z^4 * X_1(z)"; ...
       "ROC: 1/3 < |z| < 2 (Giu nguyen ROC cau a)"], "fontsize", 2);


// =========================================================================
// CÂU (d): x_4(n) = x_1(-n) (Phép đảo thời gian Time Reversal)
// Tính chất: Z{x(-n)} = X(z^-1). ROC bị nghịch đảo: 1/r2 < |z| < 1/r1
// Cực mới: p1' = 1/2 = 0.5 ; p2' = 1/(1/3) = 3
// ROC: Vành khăn 1/2 < |z| < 3 (0.5 < |z| < 3)
// =========================================================================
subplot(2, 2, 4);
r1_d = 0.5;
r2_d = 3.0;
limit_d = 3.8;

// 1. Tô màu miền ROC (vành khăn giữa 0.5 và 3.0)
draw_annulus(r1_d, r2_d, color(210, 235, 255));

// 2. Vẽ 2 đường tròn biên
plot(r1_d * cos(theta), r1_d * sin(theta), "b--", "LineWidth", 1.5);
plot(r2_d * cos(theta), r2_d * sin(theta), "r--", "LineWidth", 1.5);

// 3. Khung tọa độ và đường tròn đơn vị
setup_z_plane(limit_d);

// 4. Đánh dấu các cực mới
plot_pole(r1_d, 0, "p_1'' = 0.5");
plot_pole(r2_d, 0, "p_2'' = 3");

title(["(d) x_4(n) = x_1(-n) (Phep dao thoi gian)"; ...
       "X_4(z) = X_1(z^-1)"; ...
       "ROC: 0.5 < |z| < 3 (Nghich dao mien ROC)"], "fontsize", 2);

printf("\n===================================================================\n");
printf(" DA VE THANH CONG MIEN HOI TU (ROC) CHUAN XAC CHO PROBLEM 3.3!\n");
printf(" File ma nguon: H:/XLTHS/Lab 5/lab5_problem_3_3.sci\n");
printf("===================================================================\n");

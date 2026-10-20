n = -2:10;
y = zeros(1, length(n));

k = -n + 4;

idx1 = find(k >= -3 & k <= -1);
y(idx1) = 1 + k(idx1) / 3;

idx2 = find(k >= 0 & k <= 3);
y(idx2) = 1;

plot2d3(n, y);
plot(n, y, 'ro');

xtitle('Câu b1: Gấp x(n) rồi dịch trễ 4 mẫu -> y(n) = x(-n+4)', 'n', 'y(n)');
xgrid(color('gray'));

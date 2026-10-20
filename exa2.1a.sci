n = -5:5;
x = zeros(1, length(n));

idx1 = find(n >= -3 & n <= -1);
x(idx1) = 1 + n(idx1) / 3;

idx2 = find(n >= 0 & n <= 3);
x(idx2) = 1;

plot2d3(n, x); 
plot(n, x, 'ro'); 
xtitle('Đồ thị tín hiệu rời rạc x(n)', 'n', 'x(n)');
xgrid(color('gray')); 

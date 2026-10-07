n = [-1, 0, 1];
x = [1, 3, -2];

x_rev = x($:-1:1); 

x_e = 0.5 * (x + x_rev);
x_o = 0.5 * (x - x_rev);

subplot(3, 1, 1);
plot2d3(n, x);
title('Original Signal x(n)');
xlabel('n');
ylabel('Amplitude');

// Vẽ đồ thị: x_e(n)
subplot(3, 1, 2);
plot2d3(n, x_e);
title('Even Component x_e(n)');
xlabel('n');
ylabel('Amplitude');

// Vẽ đồ thị: x_o(n)
subplot(3, 1, 3);
plot2d3(n, x_o);
title('Odd Component x_o(n)');
xlabel('n');
ylabel('Amplitude');

n = -4:6;
x = zeros(1, length(n));
x(n >= 0 & n <= 3) = 1;
x2 = zeros(1, length(n));
for i = 1:length(n)
    if (i-2 > 0) then
        x2(i) = x(i-2);
    end
end
y_d = n .* x;
y2_d = n .* x2;
y_d_delayed = zeros(1, length(n));
for i = 3:length(n)
    y_d_delayed(i) = y_d(i-2);
end
clf();
subplot(2,2,1); plot2d3(n, y_d, style=5); e=gce(); e.children.thickness=3; set(gca(),"grid",[1 1]); title('(2) y(n)');
subplot(2,2,2); plot2d3(n, y_d_delayed, style=5); e=gce(); e.children.thickness=3; set(gca(),"grid",[1 1]); title('(3) y(n-2)');
subplot(2,2,3); plot2d3(n, x2, style=5); e=gce(); e.children.thickness=3; set(gca(),"grid",[1 1]); title('(4) x2(n)');
subplot(2,2,4); plot2d3(n, y2_d, style=5); e=gce(); e.children.thickness=3; set(gca(),"grid",[1 1]); title('(5) y2(n)');

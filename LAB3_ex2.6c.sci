n = -4:6;
x = zeros(1, length(n));
x(n >= 0 & n <= 3) = 1;
x2 = zeros(1, length(n));
for i = 1:length(n)
    if (i-2 > 0) then
        x2(i) = x(i-2);
    end
end
y_c = zeros(1, length(n));
y_c_delayed = zeros(1, length(n));
y2_c = zeros(1, length(n));
for i = 2:length(n)
    y_c(i) = x(i) - x(i-1);
    y2_c(i) = x2(i) - x2(i-1);
end
for i = 3:length(n)
    y_c_delayed(i) = y_c(i-2);
end
clf();
subplot(2,2,1); plot2d3(n, y_c, style=5); e=gce(); e.children.thickness=3; set(gca(),"grid",[1 1]); title('(2) y(n)');
subplot(2,2,2); plot2d3(n, y_c_delayed, style=5); e=gce(); e.children.thickness=3; set(gca(),"grid",[1 1]); title('(3) y(n-2)');
subplot(2,2,3); plot2d3(n, x2, style=5); e=gce(); e.children.thickness=3; set(gca(),"grid",[1 1]); title('(4) x2(n)');
subplot(2,2,4); plot2d3(n, y2_c, style=5); e=gce(); e.children.thickness=3; set(gca(),"grid",[1 1]); title('(5) y2(n)');

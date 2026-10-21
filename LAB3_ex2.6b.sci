n = -4:6;
x = zeros(1, length(n));
x(n >= 0 & n <= 3) = 1;
x2 = zeros(1, length(n));
for i = 1:length(n)
    if (i-2 > 0) then
        x2(i) = x(i-2);
    end
end
y_b = zeros(1, length(n));
y2_prime_b = zeros(1, length(n));
y2_b = zeros(1, length(n));
for i = 1:length(n)
    idx = n(i)^2;
    if (idx >= 0 & idx <= 3) then y_b(i) = 1; end
    if (i-2 > 0) then y2_prime_b(i) = y_b(i-2); end
    if (idx >= 2 & idx <= 5) then y2_b(i) = 1; end
end
clf();
subplot(3,2,1); plot2d3(n, x, style=5); e=gce(); e.children.thickness=3; set(gca(),"grid",[1 1]); title('(1) x(n)');
subplot(3,2,2); plot2d3(n, y_b, style=5); e=gce(); e.children.thickness=3; set(gca(),"grid",[1 1]); title('(2) y(n) = x(n^2)');
subplot(3,2,3); plot2d3(n, y2_prime_b, style=5); e=gce(); e.children.thickness=3; set(gca(),"grid",[1 1]); title('(3) y(n-2)');
subplot(3,2,4); plot2d3(n, x2, style=5); e=gce(); e.children.thickness=3; set(gca(),"grid",[1 1]); title('(4) x2(n) = x(n-2)');
subplot(3,2,5); plot2d3(n, y2_b, style=5); e=gce(); e.children.thickness=3; set(gca(),"grid",[1 1]); title('(5) y2(n) = T[x2(n)]');

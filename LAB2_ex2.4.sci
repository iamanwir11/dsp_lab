n = -5:5;

ur = n .* bool2s(n >= 0);

plot2d3(n, ur);

xgrid();
xtitle('Unit Ramp Signal ur(n)', 'n', 'Amplitude');

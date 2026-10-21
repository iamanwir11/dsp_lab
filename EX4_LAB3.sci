function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    n1_min = 1 - x1origin;
    n1_max = length(x1n) - x1origin;
    n2_min = 1 - x2origin;
    n2_max = length(x2n) - x2origin;
    
    n_min = min(n1_min, n2_min);
    n_max = max(n1_max, n2_max);
    n = n_min : n_max;
    
    yorigin = 1 - n_min;
    
    y1 = zeros(1, length(n));
    y2 = zeros(1, length(n));
    
    y1( (n1_min - n_min + 1) : (n1_max - n_min + 1) ) = x1n;
    y2( (n2_min - n_min + 1) : (n2_max - n_min + 1) ) = x2n;
    
    yn = y1 + y2;
    
    scf();
    clf();
    
    subplot(3, 1, 1);
    plot2d3(n1_min:n1_max, x1n);
    plot(n1_min:n1_max, x1n, 'ro');
    xtitle('Tín hiệu 1: x1(n)', 'n', 'Biên độ');
    xgrid(1);
    
    subplot(3, 1, 2);
    plot2d3(n2_min:n2_max, x2n);
    plot(n2_min:n2_max, x2n, 'go');
    xtitle('Tín hiệu 2: x2(n)', 'n', 'Biên độ');
    xgrid(1);
    
    subplot(3, 1, 3);
    plot2d3(n, yn);
    plot(n, yn, 'bo');
    xtitle('Tín hiệu tổng: y(n) = x1(n) + x2(n)', 'n', 'Biên độ');
    xgrid(1);
endfunction

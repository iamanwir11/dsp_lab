function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    yn = conv(xn, hn);
    yorigin = xorigin + horigin - 1;
    
    nx = (1 - xorigin) : (length(xn) - xorigin);
    nh = (1 - horigin) : (length(hn) - horigin);
    ny = (1 - yorigin) : (length(yn) - yorigin);
    
    // Vẽ đồ thị tín hiệu x(n)
    subplot(3, 1, 1);
    plot2d3(nx, xn);
    plot(nx, xn, 'ro');
    xtitle('Tín hiệu ngõ vào: x(n)', 'n', 'Biên độ');
    xgrid(1);
    
    // Vẽ đồ thị tín hiệu h(n)
    subplot(3, 1, 2);
    plot2d3(nh, hn);
    plot(nh, hn, 'go');
    xtitle('Đặc tính hệ thống: h(n)', 'n', 'Biên độ');
    xgrid(1);
    
    // Vẽ đồ thị tín hiệu y(n)
    subplot(3, 1, 3);
    plot2d3(ny, yn);
    plot(ny, yn, 'bo');
    xtitle('Tín hiệu ngõ ra: y(n) = x(n) * h(n)', 'n', 'Biên độ');
    xgrid(1);
endfunction

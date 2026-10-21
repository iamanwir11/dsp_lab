function [yn, yorigin]=fold(xn, xorigin)
    yn = xn($:-1:1)
    yorigin=length(xn)-xorigin+1;
    
    nx=(1-xorigin):(length(xn)-xorigin);
    ny=(1-yorigin):(length(yn)-yorigin);
    
     subplot(2,1,1);
    plot2d3(nx,xn);
    plot(nx, xn, 'r.');
    xtitle('Tín hiệu gốc x(n)', 'n', 'Biên độ');
    xgrid(1);
    
    subplot(2, 1, 2);
    plot2d3(ny, yn);
    plot(ny, yn, 'b.');
    xtitle('Tín hiệu đảo y(n) = x(-n)', 'n', 'Biên độ');
    xgrid(1);
    a2 = gca();
    a2.data_bounds = [min(ny)-0.5, min(yn)-1; max(ny)+0.5, max(yn)+1];
    
endfunction

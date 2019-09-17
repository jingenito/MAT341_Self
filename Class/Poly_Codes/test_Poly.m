function test_Poly()
    a = [1 1.5 2.5];
    x = 77;
    
    %test poly code 1
    val1 = p1(x)
    
    %test poly code 2
    val2 = p2(a(1), a(2), a(3), x)
    
    %test poly code 3
    val3 = p3(a, x)
    
    %vector of x-values
    xVec = -3:0.01:4.5;
    
    for i=1:length(xVec)
        yVec(i) = p3(a, xVec(i));
    end
    
    %
    % Plotting attributes
    %
    lw = 4;
    fs = 18;
    
    plot(xVec,yVec,'r', 'linewidth', lw)
    %semilogx(xVec,yVec,'r', 'linewidth', lw)
    xlabel('x');
    ylabel('y');
    leg = legend('2nd Order Poly');
    set(gca,'fontsize',fs);
end
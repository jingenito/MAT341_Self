function test_Poly()
    a = [1 1.5 2.5];
    x = 77;
    
    %test poly code 1
    val1 = p1(x)
    
    %test poly code 2
    val2 = p2(a(1), a(2), a(3), x)
    
    %test poly code 3
    val3 = p3(a, x)
end
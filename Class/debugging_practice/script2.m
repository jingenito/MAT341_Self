function script2()

x = 1.25:0.025:2.5;
y = [];
for i=1:length(x)
    y(i) = f(x(i));
end

ms = 10;
lw = 5;

plot(x,y,'k.-','MarkerSize',ms,'LineWidth',lw);
xlabel('x');
ylabel('y');

function val = f(x)
val = 5*sin(x^2)*cos(x);

x = [0,1,2,3,4];
y = [1,-1,3,1,2];

p1 = polyfit(x, y, 1);
p2 = polyfit(x, y, 2);
p3 = polyfit(x, y, 3);
p4 = polyfit(x, y, 4);

y1 = polyval(p1,x);
y2 = polyval(p2,x);
y3 = polyval(p3,x);
y4 = polyval(p4,x);

x1 = 0:0.1:4;

hold on;

xlabel('X');
ylabel('y');
plot(x, y, '*');
plot(x1,polyval(p1,x1), 'g');
plot(x1,polyval(p2,x1), 'y');
plot(x1,polyval(p3,x1), 'b');
plot(x1,polyval(p4,x1), 'm');

legend('y', 'y1', 'y2', 'y3', 'y4', 'Location','southeast');
hold off;

e21 = quaderror(y, y1);
e22 = quaderror(y, y2);
e23 = quaderror(y, y3);
e24 = quaderror(y, y4);

fprintf('Der quadratische Fehler von y1 ist %f\n', e21);
fprintf('Der quadratische Fehler von y2 ist %f\n', e22);
fprintf('Der quadratische Fehler von y3 ist %f\n', e23);
fprintf('Der quadratische Fehler von y4 ist %f\n', e24);
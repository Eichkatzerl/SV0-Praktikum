x = [0,1,2,3,4,5];
y = [8,7,8,4,7,11];
f = {(@(x) cos(0.*x)),(@(x) cos(x)),(@(x) cos(2.*x)),(@(x) cos(3.*x))};

c = sigapp(x,y,f);

y1 = zeros(1, length(y));

for i=1:1:length(x)
   for k=1:1:length(f)
      y1(i) = y1(i) + c(k)*f{k}(x(i));
   end
end

e2 = quaderror(y, y1);
fprintf('Der quadratische Fehler ist %f\n', e2);

x1 = -1:0.1:6;
y1 = zeros(1, length(x1));

for i=1:1:length(x1)
   for k=1:1:length(f)
      y1(i) = y1(i) + c(k)*f{k}(x1(i));
   end
end

hold on;

xlabel('X');
ylabel('y');
plot(x, y, '*');
plot(x1,y1);
legend('f', 'fapp', 'Location','southeast');

hold off;
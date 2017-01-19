x = [0,1,2,3,4];
y = [2,1,3,5,3];
f = {(@(x) exp(0*x)),(@(x) exp(x)),(@(x) exp(-x))};

c = sigapp(x,y,f);

y1 = zeros(1, length(y));

for i=1:1:length(x)
   for k=1:1:length(f)
      y1(i) = y1(i) + c(k)*f{k}(x(i));
   end
end

e2 = quaderror(y, y1);
fprintf('Der quadratische Fehler ist %f\n', e2);

x1 = -1:0.1:5;
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
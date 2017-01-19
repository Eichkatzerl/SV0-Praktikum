
SWAL=swalsys(16)
Y = [SWAL SWAL(:,16)];
hold on
for k = 1:16
	x = 0:16;
    y=Y(k,:)-(3*k);
    [x, y] = stairs(x,y);
    plot(x,y,'b');
end
axis([0 16 -50 0])
set(gca, 'XTick', []);
set(gca, 'YTick', []);

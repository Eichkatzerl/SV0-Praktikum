time=1:14;
for i=1:14
    tic
    swalsys(2^i);
    time(i)=toc;
end

plot(1:14,time);
grid on

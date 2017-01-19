x=harm(0:3, 0:0.01:0.99);



for i = 1:100
    xp=[0, real(x(1,i))];
    yp=[0, imag(x(1,i))];
    subplot(2,4,1)
    plot(xp,yp,'*-')
    axis([-1.5 1.5 -1.5 1.5])
    title('k=0')

    
    xp=[0, real(x(2,i))];
    yp=[0, imag(x(2,i))];
    subplot(2,4,2)
    plot(xp,yp,'*-')
    axis([-1.5 1.5 -1.5 1.5])
    title('k=1')

    
    xp=[0, real(x(3,i))];
    yp=[0, imag(x(3,i))];
    subplot(2,4,3)
    plot(xp,yp,'*-')
    axis([-1.5 1.5 -1.5 1.5])
    title('k=2')
  
    
    xp=[0, real(x(4,i))];
    yp=[0, imag(x(4,i))];
    subplot(2,4,4)
    plot(xp,yp,'*-')
    axis([-1.5 1.5 -1.5 1.5])
    title('k=3')

    
    %real und imaginaerteil

    subplot(2,4,5)
    plot([0 real(x(1,i))],[0 0])
    hold on
    plot([0 0],[0 imag(x(1,i))])
    hold off
    axis([-1.5 1.5 -1.5 1.5])
    title('k=0')
    
    subplot(2,4,6)
    plot([0 real(x(2,i))],[0 0])
    hold on
    plot([0 0],[0 imag(x(2,i))])
    hold off
    axis([-1.5 1.5 -1.5 1.5])
    title('k=1')
     
    subplot(2,4,7)
    plot([0 real(x(3,i))],[0 0])
    hold on
    plot([0 0],[0 imag(x(3,i))])
    hold off
    axis([-1.5 1.5 -1.5 1.5])
    title('k=2')
    
    subplot(2,4,8)
    plot([0 real(x(4,i))],[0 0])
    hold on
    plot([0 0],[0 imag(x(4,i))])
    hold off
    axis([-1.5 1.5 -1.5 1.5])
    title('k=3')
    pause(0.1)
end

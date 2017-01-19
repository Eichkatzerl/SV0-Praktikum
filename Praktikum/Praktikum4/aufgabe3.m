t = 0 :1/512 :1-1/512;
k = 0:9;
m = 0:9;
O=zeros(length(k),length(m));
for a = 1:length(k)
    for b = 1:length(m)
        O(a,b)=exp(1i*(a-1)*2*pi*t)*transpose(exp(-1i*(b-1)*2*pi*t));
    end
end
O
x=O-diag(diag(O));
if (all(x(:) < 1/10000))
    disp('exp(i*k*2*pi*t) und exp(i*m*2*pi*t) sind orthogonal.');
else
    disp('exp(i*k*2*pi*t) und exp(i*m*2*pi*t) sind nicht orthogonal.');
end

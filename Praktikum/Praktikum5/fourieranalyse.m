function [a,b] = fourieranalyse(fn,K)

if (2*K+1 > length(fn))
    error('2K+1 > N');
end

N = length(fn);
a=zeros(1,K+1);
for k = 0:K
    for n=0:(N-1)
        a(k+1)= a(k+1)+(fn(n+1)*cos(2*pi*k*n/N));
    end
end
a = 2/N .* a;

b=zeros(1,K+1);
for k = 0:K
    for n=0:(N-1)
        b(k+1)= b(k+1)+(fn(n+1)*sin(2*pi*k*n/N));
    end
end
b = 2/N .* b;

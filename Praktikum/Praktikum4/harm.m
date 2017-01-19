function y = harm(k,t)
if isscalar(k)
    k=0:(k);
end

if isscalar(t)
    t=0:t;
end

y=zeros(length(k), length(t));

for m=1:length(k)
    for n=1:length(t)
        y(m,n)=exp(1i*2*pi*k(m)*t(n));
    end
end
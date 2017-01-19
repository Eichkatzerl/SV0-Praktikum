function y = fouriersynthese(N,ak,bk)
K = length(ak)-1;

if 2*K + 1 > N
    error('2*K + 1 > N.')
end

y = ak(1)/2 .* ones(1,N);

for n = 0:N-1
    for k = 1:K
        y(n+1)=y(n+1)+ak(k+1)*cos(2*pi*k*n/N)+bk(k+1)*sin(2*pi*k*n/N);
    end
end
function y = swalsys(k)
if ~(floor(log2(k)) == log2(k))
    error('k muss 2-er Potenz sein.')
end

if k == 0
    y = 1;
else
    y=zeros(k);
    for n = 0:(k-1)
        x = reshape(y(1,:), [2^(length(dec2bin(n))), k/2^(length(dec2bin(n)))]);
        z = swal(n);
        for m = 1:length(x(:,1))
        x(m,:) = z(m);
        end
        y(n+1,:) = reshape(transpose(x), [1, k]);
    end
end
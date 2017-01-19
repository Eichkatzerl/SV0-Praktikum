function y = swal(k)
BIN = dec2bin(k);
y=[1];
for i=1:length(BIN)
    if strcmp(BIN(i),'1')
        y=[y -y(end:-1:1)];
    else
        y=[y y(end:-1:1)];
    end
end
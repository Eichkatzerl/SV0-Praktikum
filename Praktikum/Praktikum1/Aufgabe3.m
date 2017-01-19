BinKoeff = zeros(9, 13);
for n = -9:-1
  for k = 10:23
    BinKoeff(n+10,k-9)=bincoeff(n,k);
  endfor
endfor
surf(BinKoeff)
xlabel('k')
ylabel('n')
zlabel('Binimalkoeffizient(n,k)')
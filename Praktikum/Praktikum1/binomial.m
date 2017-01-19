function y = binomial(n,k)
if nargin!=2
  error("Es muessen 2 Parameter an binomial(n,k) uebergeben werden")
elseif !isscalar(n) || !isscalar(k)
  error("Die Parameter n und k muessen Sklare sein")
elseif !isreal(n)
  error("Als Parameter k muss eine reelle Zahl uebergeben werden")
elseif !(imag(k)==0 && mod(k,1)==0)
  error("Als Parameter n muss eine natuerliche Zahl uebergeben werden")
else
  y=1;
  for i = 1:k
    y*=(n+1-i)/i; 
  endfor
endif
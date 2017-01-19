function y = fakultaet2(x)
if x==1 || x==0
  y=1;
else 
  y = x*fakultaet2(x-1);
endif
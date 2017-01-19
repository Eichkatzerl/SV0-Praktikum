O=swalsys(16)*transpose(swalsys(16));
O
x=O-diag(diag(O));
if (all(x(:) < 1/10000))
    disp('Die Walshfunktionen sind orthogonal.');
else
    disp('Die Walshfunktionen sind nicht orthogonal.');
end

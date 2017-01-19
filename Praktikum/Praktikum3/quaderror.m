function e2 = quaderror(f, fap)

if (~isvector(f) || ~isvector(fap))
    error('Eingaben nur als Vektoren');
end

[mf, nf] = size(f);
[mfap, nfap] = size(fap);

if (mf ~=mfap || nf~=nfap)
    error('Vektoren haben verschiedene Dimensionen');
end

e2 = sum((f-fap).^2);
    
end
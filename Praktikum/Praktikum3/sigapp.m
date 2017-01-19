function c = sigapp(x, y, f)

if nargin < 3
    error('Zu wenig Argumente');
end

[mf, nf] = size(x);
[mfap, nfap] = size(y);

if (mf ~=mfap || nf~=nfap)
    error('Vektoren haben verschiedene Dimensionen');
end

if length(f) < 1
    error('Es muss mindestens eine Funktion geben');
end

FF = zeros(length(f), length(x));

for i=1:length(f)
   FF(i,:) = f{i}(x); 
end

f1 = FF * y';
FF = FF * FF';

c = FF \ f1;

end


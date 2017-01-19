function [wert, anzahl] = haeufigkeit(daten)
wert=unique(daten);
anzahl=zeros(1,length(wert));
daten=reshape(daten,columns(daten)*rows(daten),1);
for j=1:length(wert)
  for i=1:length(daten)
    if (daten(i)==wert(j))
      anzahl(j) +=1;
    endif
  endfor
endfor

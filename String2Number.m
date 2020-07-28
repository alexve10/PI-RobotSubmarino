function S=String2Number(Lista)
Lista1 = regexprep(Lista,'[','');
Lista2 = regexprep(Lista1,']','');
Lista3 = strrep(Lista2, '"', '');
S = str2num(Lista3);
end

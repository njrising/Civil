function mat = getMatrixElement(rowElement,colElement,G)
nCol = size(colElement,2);
nRow = size(rowElement,2);
mat = zeros(nRow,nCol);
for aa = 1:nRow
    for bb = 1:nCol
        mat(aa,bb) = G(rowElement(aa),colElement(bb));
    end  
end  
end
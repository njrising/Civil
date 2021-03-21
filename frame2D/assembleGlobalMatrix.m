function G = assembleGlobalMatrix(Mat,i,G)
for aa = 1:6
    for bb = 1:6
        G(i(aa),i(bb)) = G(i(aa),i(bb)) + Mat(aa,bb);       
    end
end
end
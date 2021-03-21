function k = localStiffnessMatrix(A,E,L)
    k = zeros(4,4);
    n = A*E/L;
    k(1,1) = n;  k(1,2) = 0;  k(1,3) = -n; k(1,4) = 0;
    k(2,1) = 0;  k(2,2) = 0;  k(2,3) = 0;  k(2,4) = 0;
    k(3,1) = -n; k(3,2) = 0;  k(3,3) = n;  k(3,4) = 0;
    k(4,1) = 0;  k(4,2) = 0;  k(4,3) = 0;  k(4,4) = 0; 
end
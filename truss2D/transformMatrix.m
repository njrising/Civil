function t = transformMatrix(s,c)
    t = zeros(4,4);
    t(1,1) = c;  t(1,2) = -s; t(1,3) = 0; t(1,4) = 0;
    t(2,1) = s;  t(2,2) = c;  t(2,3) = 0; t(2,4) = 0;
    t(3,1) = 0;  t(3,2) = 0;  t(3,3) = c; t(3,4) = -s;
    t(4,1) = 0;  t(4,2) = 0;  t(4,3) = s; t(4,4) = c; 
end
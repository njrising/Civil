function [E,A,L,O,index,n] = readMaterial(file_name)
% function loads material information of the truss elements
% A material.txt file must be present in the directory 
% See example text file for formatting 
E = [];     % Young's Modulus
A = [];     % Area
L = [];     % Length
O = [];     % orientation (s,c)
index = []; % indexes
fileID = fopen(file_name,'r');
token = fgetl(fileID);          % obtain first token #E
 % Read in Young's Modulus
token = fgetl(fileID);
while token ~= "#A"
    E = [E,' ',token];
    token = fgetl(fileID);
end
% Read in cross-sectional area
token = fgetl(fileID);    
while token ~= "#L"
    A = [A,' ',token];
    token = fgetl(fileID);
end
% Read in the beam lengths
token = fgetl(fileID);    
while token ~= "#O"
    L = [L,' ',token];
    token = fgetl(fileID);
end
 % Read in orientation data
token = fgetl(fileID);
while token ~= "#I"
    O = [O,' ',token];
    token = fgetl(fileID);
end
 % Read in index data
token = fgetl(fileID);
while token ~= "#N"
    index = [index,' ',token];
    token = fgetl(fileID);
end
n = fgetl(fileID);
fclose(fileID);
% Convert string to number
E = str2num(E);
A = str2num(A);
L = str2num(L);
O = str2num(O);
index = str2num(index);
n = str2num(n);
end
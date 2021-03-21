function [ind,P] = readForces(file_name)
ind = [];
P = [];
fileID = fopen(file_name,'r');
token = fgetl(fileID);          % obtain first token #I
 % Read in orientation data
token = fgetl(fileID);
while token ~= "#P"
    ind = [ind,' ',token];
    token = fgetl(fileID);
end
 % Read in index data
token = fgetl(fileID);
while token ~= -1
    P = [P,' ',token];
    token = fgetl(fileID);
end
fclose(fileID);
ind = str2num(ind);
P = str2num(P)';
end
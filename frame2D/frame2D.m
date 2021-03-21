function frame2D
% Linear static solver for 2D frames
% demonstrating the direct stiffness method
% The solution is written to a text file 
% "Solutions.txt" in the directory

% Read material data
[E,A,I,L,O,index,n] = readMaterial('material.txt');
% Read force data
[ind,P] = readForces('forces.txt');

nDOF = max(index);
globalMatrix = zeros(nDOF);
globalDisp = zeros(nDOF,1);
% Assemble global stiffness matrix
for ii = 1:n
   kLocal = localStiffnessMatrix(E(ii),A(ii),I(ii),L(ii));                          % member local stiffness matrix                                  
   T = transformMatrix(O(2*ii-1),O(2*ii));                                          % member transformation matrix
   kGlobal = T' * kLocal * T;                                                       % transform to global coordinates
   globalMatrix = assembleGlobalMatrix(kGlobal, index(6*ii-5:6*ii), globalMatrix);  % assemble the global stiffness matrix
end

% System matrix
systemMatrix = getMatrixElement(ind,ind,globalMatrix);
% Solve
globalDisp(ind) = systemMatrix\P;

% Write results to file
nlabel = linspace(1,nDOF,nDOF);
fileID = fopen('Solution.txt','w');
fprintf(fileID,'#This is an output from frame2D \n');
% Displacements
fprintf(fileID,'#----Global Displacements----\n');
fprintf(fileID,'% .10g \n',globalDisp);
% Reactions
Reactions = globalMatrix * globalDisp;
fprintf(fileID,'#----Global Reactions----\n');
fprintf(fileID,'% .10g \n',Reactions);
% Internal forces
fprintf(fileID,'#----Internal Forces----\n');
for jj = 1:n
    k = localStiffnessMatrix(E(jj),A(jj),I(jj),L(jj));
    T = transformMatrix(O(2*jj-1),O(2*jj));
    fm = k * T' * globalDisp(index(6*jj-5:6*jj));
    fprintf(fileID,'# Bar % .10g \n',nlabel(jj));
    fprintf(fileID,'% .10g ',fm);
    fprintf(fileID,'\n');
end


end
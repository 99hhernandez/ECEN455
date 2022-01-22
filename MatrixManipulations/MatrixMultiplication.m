% Defining matrices
X = [1; 2; 3; 2; 1];
Y = [0.5; -1; -1; -1; 0.5];
Z = [5 0 0 0 0; 0 4 0 0 0; 0 0 3 0 0; 0 0 0 2 0; 0 0 0 0 1];

%2a: Transpose matrix X
A = X';
fprintf('2a.) X'':\n');
disp(A);

%2b: Multiply matrix X by 2 and add 3
B = 2 * X + 3;
fprintf('2b.) 2*X+3:\n');
disp(B);

%2c: Multiply matrix X by 0.5 and matrix Y by i
%    add the products of both matrices
C = 0.5 * X + 1i * Y;
fprintf('2c.) 0.5*X+1i*Y:\n');
disp(C);

%2d: Divide element-wise matrix X by matrix Y
%    elements from matrix X divide with their corresponding 
%    element from matrix Y
D = X ./ Y;
fprintf('2d.) X./Y:\n');
disp(D);

%2e: Multiply element-wise matrix X with matrix Y
E = X .* Y;
fprintf('2e.) X.*Y:\n');
disp(E);

%2f: Multiply the transpose matrix of X with matrix Y
F = X' * Y;
fprintf('2f.) X''*Y:\n');
disp(F);

%2g: Multiply matrix Z with matrix X
G = Z * X;
fprintf('2g.) Z*X:\n');
disp(G);

%2h: Multiply the transpose matrix X with matrix Z
H = X' * Z;
fprintf('2h.) X''*Z:\n');
disp(H);

%2i: Vertically concatenate matrix Y to matrix X
I = [X; Y];
fprintf('2i.) [X;Y]:\n');
disp(I);

%2j: Horizontally concatenate the product of 2 and matrix Y to matrix X
J = [X, 2 * Y];
fprintf('2j.) [X,2*Y]:\n');
disp(J);

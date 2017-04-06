function main()

maxVal = 100;
n = 100;
A = randi(maxVal, n);
A = (A + A')/2;
A = A + maxVal*n*eye(n);
b = sum(A, 2);
%A = [0.003, 30.0; 1.0, 4.0];
%b = [5.001;1.0];
x = LU(A, b);
disp(x);
%A = [10, 20, 30; 20, 45, 80; 30, 80, 171];
%b = [0;15;61];
if issymmetric(A) && all(eig(A) > 0)
    x = Cholesky(A, b);
    disp(x);
end
end
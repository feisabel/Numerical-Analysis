function main()

maxVal = 30;
n = 10;
A = randi(maxVal, n);

b = sum(A, 2);
%A = [0.003, 30.0; 1.0, 4.0];
%b = [5.001;1.0];
%A = [0.003, 59.14; 100.291, -6.13];
%b = [59.17;996.78];
%A = [2, 1, 1, 0; 4, 3, 3, 1; 8,7,9,5;6,7,9,8];
%b = [5.0000e-10; 5.0000e-10; 5.0000e-10; 3.0000e+12];
disp('LU:');
x = LU(A, b);
disp('x =');
disp(x);
%A = [10, 20, 30; 20, 45, 80; 30, 80, 171];
%b = [0;15;61];
A = (A + A')/2;
A = A + maxVal*n*eye(n);
b = sum(A, 2);
if issymmetric(A) && all(eig(A) > 0)
    disp('Cholesky:');
    x = Cholesky(A, b);
    disp('x =');
    disp(x);
end

D = diag(diag(A));
ID = diag(diag(A).^(-1));
nm = norm(ID * (A-D),Inf);
%A = [2,1;-1,3];
%b = sum(A,2);
%n = 2;
if nm < 1
    disp('Jacobi:');
    x = Jacobi(A, b, zeros(n,1), 0.1);
    disp('x =');
    disp(x);
    disp('Gauss-Seidel:');
    x = Gauss_Seidel(A, b, zeros(n,1), 0.1);
    disp('x =');
    disp(x);
end
end
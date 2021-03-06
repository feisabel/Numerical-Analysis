function main()

maxVal = 10;
n = 5;
A = randi(maxVal, n);
b = sum(A, 2);

%A = [0.003, 30.0; 1.0, 4.0];
%b = [5.001;1.0];

A = [10, 20, 30; 20, 45, 80; 30, 80, 171];
b = [0;15;61];

%A = [2,1;1,3];
%b = [3;4];
%n = 2;

disp('LU:');
x = LU(A, b);
disp('x =');
disp(x);

%{
A = (A + A')/2;
A = A + maxVal*n*eye(n);
b = sum(A, 2);
%}

if issymmetric(A) && all(eig(A) > 0)
    disp('Cholesky:');
    x = Cholesky(A, b);
    disp('x =');
    disp(x);
end

D = diag(diag(A));
ID = diag(diag(A).^(-1));
nm = norm(ID * (A-D),Inf);

if nm < 1
    disp('Jacobi:');
    x = Jacobi(A, b, zeros(n,1), 0.0001);
    disp('x =');
    disp(x);
    %{
    disp('Jacobi 2:');
    x = Jacobi(A, b, zeros(n,1) + 10, 0.0001);
    disp('x =');
    disp(x);
    %}
    disp('Gauss-Seidel:');
    x = Gauss_Seidel(A, b, zeros(n,1), 0.0001);
    disp('x =');
    disp(x);
    %{
    disp('Gauss-Seidel 2:');
    x = Gauss_Seidel(A, b, zeros(n,1)+10, 0.0001);
    disp('x =');
    disp(x);
    %}
else
    disp('N�o � poss�vel executar Jacobi e Gauss-Seidel pois a norma de ||D^(-1) (A-D)|| � maior ou igual a 1:');
    disp(nm);
end
end
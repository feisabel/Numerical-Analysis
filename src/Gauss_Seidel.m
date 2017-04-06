function x = Gauss_Seidel(A, b, prev, eps)
tic;
n = size(A,1);
x = zeros(n, 1);
nm = eps;
steps = 0;
disp(prev);
while nm >= eps
    steps = steps + 1;
    for i = 1:n
        sum = 0;
        for j = 1:i-1
               sum = sum + A(i,j)*x(j);
        end
        for j = i+1:n
               sum = sum + A(i,j)*prev(j);
        end
        sum = sum - b(i);
        x(i) = -1 * sum / A(i,i);
    end
    nm = max(abs(x - prev));
    prev = x;
    disp('--------------------------------');
    disp(prev);
end
%disp('passos Gauss-Seidel:');
%disp(steps);
t = toc;
%disp('tempo Gauss-Seidel:');
%disp(t);
end
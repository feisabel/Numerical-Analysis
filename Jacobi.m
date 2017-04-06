function x = Jacobi(A, b, prev, eps)
n = size(A,1);
x = zeros(n, 1);
nm = eps;
while nm >= eps
    for i = 1:n
        sum = 0;
        for j = 1:n
            if i ~= j
                sum = sum + A(i,j)*prev(j);
            end
        end
        sum = sum - b(i);
        x(i) = -1 * sum / A(i,i);
        nm = max(x - prev);
        prev = x;
    end
end
end
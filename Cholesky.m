function x = Cholesky(A, b)
n = size(A,1);
%disp([A,b]);
IL = eye(n);
for i = 1:n-1
    G = eye(n);
    for j = i+1:n
        G(j,i) = -1 * A(j,i) / A(i,i);
    end
    IL = G * IL;
    A = G * A;
    b = G * b;
    %disp('--------------------------------');
    %disp([A,b]);
end
ID = diag(diag(A).^(-1));
x = IL.' * ID * b;
end
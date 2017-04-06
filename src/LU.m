function x = LU(A, b)
tic;
n = size(A,1);
x = zeros(n, 1);
disp([A,b]);
IL = eye(n);
for i = 1:n-1
    [dummy, r] = max(abs(A(i:n,i)));
    r = r + i - 1;
    if r > i
        aux = A(r,:);
        A(r,:) = A(i,:);
        A(i,:) = aux;
        aux = b(r);
        b(r) = b(i);
        b(i) = aux;
        disp('--------------------------------');
        disp('Troca de pivô');
        disp([A,b]);
    end
    G = eye(n);
    for j = i+1:n
        G(j,i) = -1 * A(j,i) / A(i,i);
    end
    IL = G * IL;
    A = G * A;
    b = G * b;
    disp('--------------------------------');
    disp([A,b]);
end

for i = n:-1:1
    x(i) = b(i);
    for j = i+1:n
        x(i) = x(i) - A(i,j)*x(j);
    end
    x(i) = x(i) / A(i,i);
end
t = toc;
%disp('tempo LU:');
%disp(t);
end
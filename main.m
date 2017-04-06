function main()

A = randi(10, 10);
b = sum(A, 2);
%A = [0.003, 30.0; 1.0, 4.0];
%b = [5.001;1.0];
x = LU(A, b);
disp(x);
end
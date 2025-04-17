A = [5 8 10 12 15];
B = [100 200 300 400 500];

target = 10;

pos = find(A == target);

value_in_B = B(pos);
disp(value_in_B);
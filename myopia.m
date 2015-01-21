clear;
A=xlsread('myopia.xls');
y=A(:,18);
x=[ones(618,1) A(:,1) A(:,2) A(:,3) A(:,4) A(:,5) A(:,6) A(:,7) A(:,8) A(:,9) A(:,10) A(:,11) A(:,12) A(:,13) A(:,14) A(:,15) A(:,16) A(:,17)];
%y=x*beta
fterm = inv(x'*x);
sterm=x'*y;
beta=fterm*sterm;
disp(beta);

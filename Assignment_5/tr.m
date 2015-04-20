% x= nputs in binary
%hidden layer is fixed :1
% O         
%       O       
% O         O==> output layer
%       O 
% O     

no_x=input('Number of inputs');

w1=zeros(no_x,no_x);
w2=0;
h=input('Number of neurons in hidden layer');
if(h~=0)
    w2=zeros(no_x,h);end
w3=zeros(h,1);
%a1=zeros(no_x,1);
%b1=10*ones(no_x,1);
%a2=zeros(h,1);
%b2=10*ones(h,1);
%a3=0;
%b3=10;
z3=zeros(2^no_x,1);
disp('Enter the table of inputs and its corresponding output:');
table=zeros(2^no_x,no_x+1);
table =input('Enter');
x=table(:,1:no_x);
% x=[10*ones(2^no_x,1) x];
d=table(:,no_x+1);

% w1=[ones(1,no_x);w1];
% w2=[ones(1,size(w2,2));w2];
% w3=[ones(1,size(w3,2));w3];
%%
% feedforward
while sum(abs(d-z3))~=0 
    
    disp('HI');
a1 = (x*w1);
a1=a1';
z1=sign(a1);
a2=z1*w2 ;
a2=a2';
z2=sign(a2);

a3=z2*w3 ;
a3=a3';
z3=sign(a3);

% deltaw3=a2*(d-z3)*(z3*(1-z3));
% deltaw2=a1*(z2(1-z2))*w3*(z3*(1-z3))*(d-z3);
% deltaw1=x*(z1(1-z1))*w2*(z2(1-z2))*w3*(z3*(1-z3))*(d-z3);
deltaw3=z2'*((d-z3)*(z3'*(1-z3)));
w3=w3-0.5*deltaw3;
deltaw2=z1'*((d-z3)*(z3'*(1-z3))*w3'*(z2'*(1-z2)));
w2=w2-0.5*deltaw2;
deltaw1=x'*((d-z3)*(z3'*(1-z3))*w3'*(z2'*(1-z2))*w2'*(z1'*(1-z1)));
w1=w1-0.5*deltaw1;
end
disp(w1);
disp(w2);
disp(w3);






% define function that computes this density
f = @(p,x) p(1)*(p(2) *normpdf(x,p(3),abs(p(4))) + ...
                (1-p(2))*normpdf(x,p(5),abs(p(6))));

% define some parameters
% scale proportion mu1 sig1 mu2 sig2
p0 = [ 10 0.6 25 10 60 20];

% generate normal mixture density plus noise
x = linspace(0,100)';
y = f(p0,x) + 0.01*randn(size(x));
plot(x,y,'bx')

% fit to data and overlay on plot
% hint: start with larger sigma values to help iterations succeed
p = nlinfit(x,y,f,[20 .5 30 30 70 30])
line(x,f(p,x),'color','r')
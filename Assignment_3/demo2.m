%rng(1234,'twister') % Set the random seed for reproducibility
mus = [-1 9];       % means mu
sigmas = [3 4];     % variances sigmas
N = 2500;           % number of elements per component
M = 10;             % number of random restarts for E-M

% Generate some random numbers
y1 = random('normal', mus(1), sigmas(1), [N, 1]);
y2 = random('normal', mus(2), sigmas(2), [N, 1]);
y  = [y1; y2];

% img = imread('D:\college\sem_6\machine\Assignments\first\Lenna.png');
% gimg = rgb2gray(img);
% mat=imhist(gimg);
% [y,x]=imhist(gimg);
% figure(1),plot(x,y);
% M=10;


% Use gmdistribution.fit (or fitgmdist) to get fitted GMM
% specifying the number of components to investigate for as 
% well as the number of random initializations
GM_obj_1 = gmdistribution.fit(y,1,'Replicates',M);
GM_obj_2 = gmdistribution.fit(y,2,'Replicates',M);
GM_obj_3 = gmdistribution.fit(y,3,'Replicates',M);
GM_obj_4 = gmdistribution.fit(y,4,'Replicates',M);

%Get the best based on AIC (you could use the BIC or the
%loglikelihood to get something else (eg. AICc, etc.)
[best_AIC_score, assoc_num_comp] = ...
   min([ GM_obj_1.AIC  GM_obj_2.AIC GM_obj_3.AIC  GM_obj_4.AIC]);

% Plot the results
ksdensity(y); hold on
x = linspace(min(y)*2, max(y)*2, 1000);
figure
plot(x ,GM_obj_2.PComponents(1) * pdf('normal', x, ... 
     GM_obj_2.mu(1), sqrt(GM_obj_2.Sigma(1))),'r')
plot(x ,GM_obj_2.PComponents(2) * pdf('normal', x, ... 
     GM_obj_2.mu(2), sqrt(GM_obj_2.Sigma(2))),'k')
legend('Original empirical density estimate', 'Comp. 1 PDF', 'Comp. 2 PDF');
grid on
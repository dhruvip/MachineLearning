% mu1 = [1 2];
% Sigma1 = [2 0; 0 0.5];
% mu2 = [-3 -5];
% Sigma2 = [1 0;0 1];
% rng(1); % For reproducibility
% X = [mvnrnd(mu1,Sigma1,1000);mvnrnd(mu2,Sigma2,1000)];
%disp(X);
GMModel =  gmdistribution.fit(X,3);
disp(GMModel);
% figure
% y = [zeros(1000,1);ones(1000,1)];
% h = gscatter(X(:,1),X(:,2),y);
% hold on
% ezcontour(@(x1,x2)pdf(GMModel,[x1 x2]),get(gca,{'XLim','YLim'}))
% title('{\bf Scatter Plot and Fitted Gaussian Mixture Contours}')
% legend(h,'Model 0','Model1')
% hold off
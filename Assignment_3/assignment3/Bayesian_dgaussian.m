clear;
img = imread('Lenna.png');
gimg = rgb2gray(img);
[y,x]=imhist(gimg);
%figure(1),plot(x,y);
[a,b]=size(gimg);
% [x,y]=meshgrid(0:512,0:512);
% surf(x,y,gimg(0:512,0:512));

one_D = reshape(gimg,1,a*b);
 options = statset('Display','final'); 
 obj =gmdistribution.fit(double(one_D'),2,'Options',options);
 sigma=obj.Sigma;
 mean=obj.mu;


 hold on
 x=[0:255];
  figure(1),plot(gaussmf(x,[sigma(:,:,1),mean(1)]),'g');
 x=[0:255];
  figure(2),plot(gaussmf(x,[sigma(:,:,2),mean(2)]));
 hold off
 img_new=zeros([a,b]);
for i=1:a
    for j=1:b
        W1=gaussmf(double(gimg(i,j)),[sigma(:,:,1),mean(1)]);
        W2=gaussmf(double(gimg(i,j)),[sigma(:,:,2),mean(2)]);
        
        %if pdf1(pixelInt+1) >= pdf2(pixelInt+1)
        if W1 > W2
            img_new(i,j)=0;
        else
            img_new(i,j)=255;
        end
    end
end

figure(2),imshow(img_new);


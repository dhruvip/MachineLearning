clear all;
close all;
clc;

img = imread('D:\college\sem_6\machine\Assignments\first\Lenna.png');
img = double(rgb2gray(img));
x = [0:255];
[rows,cols] = size(img);

vector = reshape(img,1,rows*cols);
options = statset('Display','final'); 
GMModel =gmdistribution.fit(double(vector'),2,'Options',options);
sigma = GMModel.Sigma;
mean = GMModel.mu;


% pdf1 = pdf(x, mean(1),sigma(:,:,1));
% figure, plot(x, pdf1);
% pdf2 = normpdf(x, mean(2),sigma(:,:,2));
% figure, plot(x, pdf2);
img1=zeros([rows,cols]);
for i=1:rows
    for j=1:cols
        class1 = exp(-((img(i,j)-(mean(1)))/sigma(:,:,1)).^(2)./2)./(sigma(:,:,1).*sqrt(2*pi));
        %class1 = 1./(sigma(:,:,1).*(sqrt(2.*pi))).*exp(-(img(i,j)-mu(1)).^(2)/(2.*sigma(:,:,1)));
        %class2 = 1./(sigma(:,:,2).*(sqrt(2.*pi))).*exp(-(img(i,j)-mu(2)).^(2)/(2.*sigma(:,:,2)));
        class2 = exp(-((img(i,j)-(mean(2)))/sigma(:,:,2)).^(2)./2)./(sigma(:,:,2).*sqrt(2*pi));
        pixelInt = img(i,j);
        
        %if pdf1(pixelInt+1) >= pdf2(pixelInt+1)
        if class1 > class2
            img1(i,j)=0;
        else
            img1(i,j)=255;
        end
    end
end

img1 = uint8(img1);
figure,imshow(img1);





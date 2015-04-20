
B=imread('text2.jpg');
A=rgb2gray(B);
[a,b]=size(A);
%offset is (1,1) i.e 45' & LD
features=zeros(a,b);
max_counter=(a*b)-2*a;
dim=max(max(A));
dim=dim+1;
[GLCM,S]=graycomatrix(A,'NumLevels',16,'Offset',[1 1],'Symmetric',true);


figure(1);


imshow(B);
[idx ,centroids]=kmeans(double(S(:)),9);
imseg = zeros(size(S,1),size(S,2));
for i=1:max(idx)
    imseg(idx==i)=i;
end
figure(2);
imagesc(imseg);
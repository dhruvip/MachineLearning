clear;
img = imread('D:\college\sem_6\machine\Assignments\first\Lenna.png');
gimg = rgb2gray(img);
mat=imhist(gimg);

[y,x]=imhist(gimg);
y=y/256;
plot(x,y);
GMModel =  gmdistribution.fit(y,8);
disp(GMModel);


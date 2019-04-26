clc;
clear all;
close all;
I=imread('C:\Users\user\Pictures\images.JPG');
imshow(I);
A=rgb2gray(I);
I2=histeq(A);
figure,imshow(I2),title('Image after contrast adjustment');
threshold=graythresh(I2);
B=im2bw(I2,threshold);
figure,imshow(B),title('Binary Image');
B1=bwmorph(B,'clean',inf);
figure,imshow(B1),title('Image after removing isolated pixels');
B2=imfill(B1,'holes');
figure,imshow(B2),title('Image after filling holes');
B3=bwmorph(B2,'open');
figure,imshow(B3),title('Image after morphological opening');
B4=bwareaopen(B3,11000,8);
figure,imshow(B4),title('Image after removing connected components who have pixels lesser than specified');
B5=bwmorph(B4,'majority');
for n=1:6
    B5=bwmorph(B5,'majority');
end
figure,imshow(B5),title('Image after removing minority pixels/objects');
CC=bwconncomp(B5);
disp(CC);
if(CC.NumObjects)== 1
    disp('No Crack');
else
    disp('Crack');
end


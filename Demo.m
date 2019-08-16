%====================================================
% Deno
%====================================================
% This is an implementation of a Line Drawing Generation Algorithm 
% Based on Direction Field Regularization
%===================================================
% Copyright(c) 2019 Jingjing Li,Jianlou Xu, Jing Xiong, Xuande Zhang
% All Rights Reserved.
%===================================================
% Any problems and advises are welcome .
% Email: zhangxuande@sust.edu.cn  

clc;
clear all;
close all;
Image=imread('\test\Baboon.jpg');

%% 1.Image Preprocessing Using Nonlocal Mean Filtering
tic
[Image]=Fast_Nl_Means(double(Image));
toc
imshow(Image,[]);

%% 2.Calculate the direction field
[D_f]=Img_Gradient(Image);

%% 3.Tikhonov regularization of directional field
tic     
[D_f]=Tikhonov_Df(D_f);
toc

%% 4.Judging the maximum direction of the pixel in the local area; 
% Difference of Gaussian filter Guided by Regular Directional Field
[Direct_Img]=Max_Direct(D_f);
[Dog_Img]=Rdf_Dog(Direct_Img,Image);
figure(2);imshow(Dog_Img,[]);

%% 5.Setting Nonlinear Threshold and Extracting Line Drawing
thresh =0.6; 
[Edge_Img] =Line_Extration(Dog_Img,thresh);
figure(3);imshow(Edge_Img,[]);







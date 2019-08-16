function [ out_img  ] = Dog_Process( img, sig1, sig2,P)
%沿着梯度变化最大的方向对预处理图像做引导的DoG滤波
%DoG filtering to guide preprocessed images along 
%the direction of maximum gradient change
% sig1:表示标准差
% sig2:表示标准差

ksig1 = fspecial('gaussian',[7 7],sig1);
ksig1=sum(ksig1);
ksig2 = fspecial('gaussian',[7 7],sig2);
ksig2=sum(ksig2);
S=double(img)*ksig1';
C=double(img)*ksig2';
 out_img = C-(1-P)*S;


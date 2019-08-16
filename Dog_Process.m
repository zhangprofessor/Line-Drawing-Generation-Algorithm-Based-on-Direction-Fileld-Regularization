function [ out_img  ] = Dog_Process( img, sig1, sig2,P)
%�����ݶȱ仯���ķ����Ԥ����ͼ����������DoG�˲�
%DoG filtering to guide preprocessed images along 
%the direction of maximum gradient change
% sig1:��ʾ��׼��
% sig2:��ʾ��׼��

ksig1 = fspecial('gaussian',[7 7],sig1);
ksig1=sum(ksig1);
ksig2 = fspecial('gaussian',[7 7],sig2);
ksig2=sum(ksig2);
S=double(img)*ksig1';
C=double(img)*ksig2';
 out_img = C-(1-P)*S;


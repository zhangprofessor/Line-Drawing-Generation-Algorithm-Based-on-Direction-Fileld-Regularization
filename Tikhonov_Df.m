function [output]=Tikhonov_Df(input)

% t:radius of search window
% z: Regularization parameter

t=5;
z=25;
[m,n,c]=size(input); % Size of the input
output=zeros(size(input)); % Memory for the output

% Replicate the boundaries of the input image
input2= padarray(input,[t t],'symmetric');

for i=1:m
    for j=1:n
        i1 = i+ t;
        j1 = j+ t;
        G=[];
        Matrix= input2(i1-t:i1+t,j1-t:j1+t,:);
        G=[G,reshape(Matrix(:,:,1),1,121)];  % G:Matrix of 4*121
        G=[G;reshape(Matrix(:,:,2),1,121)];
        G=[G;reshape(Matrix(:,:,3),1,121)];
        G=[G;reshape(Matrix(:,:,4),1,121)];
        Gi=[input2(i1,j1,1);input2(i1,j1,2);input2(i1,j1,3);input2(i1,j1,4)];
        % w=abs(pinv(G'*G+z*eye(size(G'*G)))*(G)'*Gi);
        
        % Accelerate the use of Tikhonov regularization
        w=abs(pinv(z)*eye(size(G'*G))*G'*pinv(G*pinv(z)*eye(size(G'*G))*G'+eye(size(G*G')))*Gi);
        
        %The product of vector w and each pixel in the search box as the regularized pixel value Gi
        output(i,j,:)=G*w;
    end
end
end

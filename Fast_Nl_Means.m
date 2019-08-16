function  [output]=Fast_Nl_Means(input)

% fast nonlocal means filter,a fast implementation of nonlocal means filter for image
% denoising.

% input :     a 2D image 
% f:          radius of square patch
% t:          searching range in each direction    
% h           degree of filtering

% Size of the image
[m n]=size(input);
f=3;
t=5;
h=8;

% Memory for the output
output=[];

% Replicate the boundaries of the input image
x2 = padarray(input,[f+t f+t],'symmetric');

kernel=Make_Kernel(f); 
squ_sum=x2.*x2; gsqu_sum=imfilter(squ_sum,kernel);
wd=2*f+1; % width of window;
[m,n]=size(input);
h=h^2;

for i=1:m
    for j=1:n

        i1 = i+ t+f;
        j1 = j+ t+f;

        rw= x2(i1-f:i1+f , j1-f:j1+f);  % reference window
        rw(:,1:end)=rw(:,2*f+1:-1:1);
        rw(1:end,:)=rw(2*f+1:-1:1,:);
        
        rw=rw.*kernel;
        bw=x2(i1-t-f:i1+t+f,j1-t-f:j1+t+f);  % big window for similarity searching
       
        % convolution computation
        cv_bw=conv2(bw,rw,'valid');
        
        gsq_dis=gsqu_sum(i1,j1)+gsqu_sum(i1-t:i1+t,j1-t:j1+t)-2*cv_bw;
        weight=exp(-gsq_dis/h);
        weight(t+1,t+1)=0;
        weight(t+1,t+1)=max(weight(:));
        est=x2(i1-t:i1+t,j1-t:j1+t).*weight;
        output(i,j)=sum(est(:))/(sum(weight(:))); 
    end
end







function [dog_img]=Rdf_Dog(direct_img,img)

% r: the radius of neighborhood pixels
% s: control the stability of edges

[m,n]=size(direct_img);
r=3; 
direct_img1= padarray(direct_img,[r r],'symmetric');
tx1 = padarray(img,[r r],'symmetric');

dog_img=zeros(m,n);

sig_c=1;s=0.001; 
sig_s=1.6*sig_c;

for i=1:m
    for j=1:n
        ii=i+r;
        jj=j+r;
        tt=direct_img1(ii,jj);
        patch=tx1(ii-r:ii+r,jj-r:jj+r);
        switch tt
            case 1
                t7=patch(1,4);
                t6=patch(2,4);
                t5=patch(3,4);
                t4=patch(4,4);
                t3=patch(5,4);
                t2=patch(6,4);
                t1=patch(7,4);
                
                iutput_x1=[ t7 t6 t5 t4 t3 t2 t1];
                dog_img(i,j)=Dog_Process(iutput_x1, sig_s, sig_c,s);
                
            case 2
                t7=patch(1,1);
                t6=patch(2,2);
                t5=patch(3,3);
                t4=patch(4,4);
                t3=patch(5,5);
                t2=patch(6,6);
                t1=patch(7,7);
                
                iutput_x1=[t7 t6 t5 t4 t3 t2 t1 ];
                dog_img(i,j) = Dog_Process(iutput_x1, sig_s,sig_c,s);

            case 3
                t7=patch(4,1);
                t6=patch(4,2);
                t5=patch(4,3);
                t4=patch(4,4);
                t3=patch(4,5);
                t2=patch(4,6);
                t1=patch(4,7);
             
                iutput_x1=[t7 t6 t5 t4 t3 t2 t1 ];
                dog_img(i,j)= Dog_Process(iutput_x1, sig_s, sig_c,s);
              
            case 4
                t7=patch(1,7);
                t6=patch(2,6);
                t5=patch(3,5);
                t4=patch(4,4);
                t3=patch(5,3);
                t2=patch(6,2);
                t1=patch(7,1);
              
                iutput_x1=[ t7 t6 t5 t4 t3 t2 t1 ];
                 dog_img(i,j)= Dog_Process(iutput_x1, sig_s, sig_c,s);
        end
    end
end
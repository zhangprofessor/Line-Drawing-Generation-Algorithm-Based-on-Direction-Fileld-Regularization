function [out_img]=Max_Direct(input)

[m,n]=size(input(:,:,1));
out_img=zeros(size(input(:,:,1)));

for i=1:m
    for j=1:n
        d1=input(i,j,1);d2=input(i,j,2);d3=input(i,j,3);d4=input(i,j,4);
        s=[abs(d1),abs(d2),abs(d3),abs(d4)];
        [index_min,index]=sort(s);
        
        % According to the index, find the direction with the largest change at the pixel;
        direct=index(:,4);
        
        switch  direct
            case  1
                out_img(i,j)=1;
            case  2
                out_img(i,j)=2;
            case  3
                out_img(i,j)=3;
            case  4
                out_img(i,j)=4;
        end
    end
end
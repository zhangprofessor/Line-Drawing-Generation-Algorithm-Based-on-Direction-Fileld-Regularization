function [out_img] =Line_Extration(input,thresh)

%thresh:ãÐÖµ

[m,n] = size(input);
out_img =ones(m,n);

for i = 1:m
    for j = 1:n
        if (1+tanh(input(i,j)))<thresh 
           out_img(i,j)=0;
       end 
    end
end


function [D_f]=Img_Gradient(input)
    m0=[-1 0 1;-2 0 2;-1 0 1];  % Horizontal direction template
    m45=[0 -1 -2;1 0 -1;2 1 0];  % Template in 45 degree direction
    m90=[-1 0 1;-2 0 2;-1 0 1]'; %Vertical direction template
    m135=[-2 -1 0;-1 0 1;0 1 2]; % Template in 135 degree direction
    d0=filter2(m0,input,'same');
    d1=filter2(m45,input,'same');
    d2=filter2(m90,input,'same');
    d3=filter2(m135,input,'same');
    D_f(:,:,1)=-d2;  % Horizontal directional field
    D_f(:,:,2)=-d3;  % Directional field in 45 degree direction
    D_f(:,:,3)=d0;   % Vertical Directional Field
    D_f(:,:,4)=d1;   % Directional field in 135 degree direction


    
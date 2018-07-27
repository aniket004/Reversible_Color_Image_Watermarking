function [ rgb ] = yuv2rgb( yuv )
%Converts a YUV image into RGB colorspace

yuv = double( yuv );
[ nr nc ns ] = size( yuv );

TI =  [  1.0000         0    1.1400
         1.0000   -0.3940   -0.5810
         1.0000    2.0280    0.0020   ];

rgb = zeros(nr,nc,3);     

for i = 1:256
    for j = 1:256
        x1 = zeros(3,1);
        for k = 1:3
            x1(k,1) = yuv(i,j,k);
        end
        temp = TI * x1;
        y1 = round( temp / 1000 );
        %y1 = round( temp );
        for k = 1:3
            rgb(i,j,k) = y1(k,1);
        end
    end
end   
    
end
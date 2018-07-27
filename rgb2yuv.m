function [ yuv ] = rgb2yuv( rgb )
%Converts an RGB image to YUV colorspace

rgb = double( rgb );
[ nr nc ns ] = size( rgb );

T = [   0.2990    0.5870    0.1140
       -0.1480   -0.2890    0.4370
        0.6150   -0.5150   -0.1000  ];

yuv = zeros(nr,nc,3);
    
for i = 1:nr
    for j = 1:nc
        x = zeros(3,1);
        for k = 1:3
            x(k,1) = rgb(i,j,k);
        end
        y = round( 1000 * T * x );
        %y = round( T * x );        
        for k = 1:3
            yuv(i,j,k) = y(k,1);
        end
    end
end
    
end
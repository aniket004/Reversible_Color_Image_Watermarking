function [ ybr ] = rgb2ybr( rgb )
%Converts an RGB image to YCbCr colorspace

rgb = double( rgb );
[ nr nc ns ] = size( rgb );

ybr = zeros(nr,nc,3);
    
for i = 1:nr
    for j = 1:nc
        R = rgb(i,j,1);
        G = rgb(i,j,2);
        B = rgb(i,j,3);
        ybr(i,j,1) = 0.2990 * R + 0.5870 * G + 0.1140 * B + 0;
        ybr(i,j,2) = -0.169 * R - 0.331 * G + 0.499 * B + 128;
        ybr(i,j,3) = 0.499 * R - 0.418 * G - 0.0813 * B + 128;
    end
end
    
end
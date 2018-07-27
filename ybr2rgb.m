function [ rgb ] = ybr2rgb( ybr )
%Converts a YCbCr image to RGB colorspace

ybr = double( ybr );
[ nr nc ns ] = size( ybr );

rgb = zeros(nr,nc,3);
    
for i = 1:nr
    for j = 1:nc
        Y = ybr(i,j,1);
        Cb = ybr(i,j,2);
        Cr = ybr(i,j,3);
        rgb(i,j,1) = round( Y + 1.402 * ( Cr - 128 ) );
        rgb(i,j,2) = round( Y - 0.344 * ( Cb - 128 ) - 0.714 * ( Cr - 128 ) );
        rgb(i,j,3) = round( Y + 1.772 * ( Cb - 128 ) );
    end
end
    
end
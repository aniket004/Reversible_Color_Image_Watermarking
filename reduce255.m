function [ p ] = reduce255( image )
%Change all color component values from 255 to 254 

if ( ischar( image ) == 1 )
    %If input image is the name of the image file 
    p = imread( image );
else
    %If input image is the pixel matrix itself
    p = image;
end

p = double(p);
[nr nc ns] = size(p);

for i = 1:nr
    for j = 1:nc
        for k = 1:ns
            if( p(i,j,k) == 255 )
                p(i,j,k) = 254;
            end
        end
    end
end

imsave( imshow( uint8(p) ) )

end


function [ psnr ] = PSNR( image_original, image_modified )
%[ psnr ] = PSNR( image_original, image_modified )
%   Computes PSNR value of an image.
%   Input: image_original -> Original image filename.
%          image_modified -> Modified image filename.
%   Output: psnr -> PSNR of the modified image (image_modified) w.r.t the
%                   original image (image_original).

if ( ischar( image_original ) == 1 )
    p1 = imread( image_original );
    p1 = double( p1 );
else
    p1 = double( image_original );
end
%p1 = imread( image_original );
if ( ischar( image_modified ) == 1 )
    p2 = imread( image_modified );
    p2 = double( p2 );
else
    p2 = double( image_modified );
end
%p2 = imread( image_modified );

mse = MSE( p1, p2 );
psnr = 10 * log10( 255*255 / mse );

disp([ 'Calculated PSNR = ', num2str(psnr) ])

end
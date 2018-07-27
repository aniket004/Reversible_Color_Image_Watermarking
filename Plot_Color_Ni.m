function [ psnr_rgb_array psnr_ybr_array bpp_rgb_array bpp_ybr_array ] = Plot_Color_Ni( image )
%Generate plots for color image watermarking

if ( ischar( image ) == 1 )
    % If input image is the name of the image file
    p = imread( image );
    p = double( p );
else
    % If input image is the pixel matrix itself
    p = double( image );
end
[ nr nc nl ] = size( p );

ybr = rgb2ybr(p);

% Initialization
psnr_rgb_array = [ ];
psnr_ybr_array = [ ];
bpp_rgb_array = [ ];
bpp_ybr_array = [ ];

for bpp = 0.005:0.005:0.5
    disp(num2str(bpp));
    len_wm = floor( bpp*nr*nc );
    b = randi( [0,1], 1, len_wm );        
    [ rgb_wm peak_r_value peak_g_value peak_b_value lenwm_rgb ] = rgbHistogram( p, b );
    psnr_rgb = PSNR(rgb_wm,p);
    psnr_rgb_array = horzcat( psnr_rgb_array, psnr_rgb );
    bpp_rgb = lenwm_rgb / ( nr*nc );
    bpp_rgb_array = horzcat( bpp_rgb_array, bpp_rgb );
    [ ybr_wm peak_y_value peak_cb_value peak_cr_value lenwm_ybr ] = ybrHistogram( ybr, b );
    psnr_ybr = PSNR(ybr_wm,ybr);
    psnr_ybr_array = horzcat( psnr_ybr_array, psnr_ybr );    
    bpp_ybr = lenwm_ybr / ( nr*nc );
    bpp_ybr_array = horzcat( bpp_ybr_array, bpp_ybr );
    if( ( len_wm > lenwm_rgb ) && ( len_wm > lenwm_ybr ) )
        break;
    end
    disp(' ');    
end

lenwm_rgb
bpp_rgb
psnr_rgb
lenwm_ybr
bpp_ybr
psnr_ybr

end


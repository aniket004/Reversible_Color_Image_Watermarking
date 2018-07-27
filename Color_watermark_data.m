function [ psnr_rgb psnr_ycocg psnr_ycucv psnr_o1o2o3 lenwm_rgb lenwm_ycocg lenwm_ycucv lenwm_o1o2o3] = Color_watermark_data( image, len_wm )
%function [ psnr_rgb psnr_ybr lenwm_rgb lenwm_ybr ] = Color_watermark_data( image, len_wm )
%To Collect PSNR Results of color image watermarking

if ( ischar( image ) == 1 )
    % If input image is the name of the image file
    rgb = imread( image );
    rgb = double( rgb );
else
    % If input image is the pixel matrix itself
    rgb = double( image );
end 
[ nr nc nl ] = size( rgb );

watermark = randi( [0 1], 1, len_wm );

%---------------------- Watermark RGB space--------------------------------
%--------------------------------------------------------------------------

wm_rgb = rgb;
[ wm_rgb(:,:,3) lenwm_rgb_3 ov3 ] = EmbedWatermarkInterpolation( rgb(:,:,3), watermark );

if( lenwm_rgb_3 < len_wm )
    watermark = randi( [0 1], 1, ( len_wm - lenwm_rgb_3 ) );
    [ wm_rgb(:,:,1) lenwm_rgb_1 ov1 ] = EmbedWatermarkInterpolation( rgb(:,:,1), watermark );
else
    lenwm_rgb_1 = 0;
end
if( ( lenwm_rgb_3 + lenwm_rgb_1 ) < len_wm )
    watermark = randi( [0 1], 1, ( len_wm - lenwm_rgb_3 - lenwm_rgb_1 ) );
    [ wm_rgb(:,:,2) lenwm_rgb_2 ov2 ] = EmbedWatermarkInterpolation( rgb(:,:,2), watermark );
else
    lenwm_rgb_2 = 0;
end
lenwm_rgb = lenwm_rgb_1 + lenwm_rgb_2 + lenwm_rgb_3;
disp( ['Watermarked RGB space: ', num2str(lenwm_rgb), ' pure watermark bits.']  );

psnr_rgb = PSNR( rgb, wm_rgb );

%----------------------YCoCg-R color space---------------------------------
%--------------------------------------------------------------------------

% Transform color space
ycocg = rgb2ycocg( rgb );

% Separate integer and fractional parts
ycocg_i = floor( ycocg );
ycocg_f = ycocg - ycocg_i;

watermark = randi( [0 1], 1, len_wm );

% Watermark YCoCg space, integer part
wm_ycocg = ycocg_i;
[ wm_ycocg(:,:,2) lenwm_ycocg_2 ov2 ] = EmbedWatermarkInterpolation( ycocg_i(:,:,2), watermark );
if( lenwm_ycocg_2 < len_wm )
    watermark = randi( [0 1], 1, ( len_wm - lenwm_ycocg_2 ) );
    [ wm_ycocg(:,:,3) lenwm_ycocg_3 ov3 ] = EmbedWatermarkInterpolation( ycocg_i(:,:,3), watermark );
else
    lenwm_ycocg_3 = 0;
end
if( ( lenwm_ycocg_3 + lenwm_ycocg_2 ) < len_wm )
    watermark = randi( [0 1], 1, ( len_wm - lenwm_ycocg_3 - lenwm_ycocg_2 ) );
    [ wm_ycocg(:,:,1) lenwm_ycocg_1 ov1 ] = EmbedWatermarkInterpolation( ycocg_i(:,:,1), watermark );
else
    lenwm_ycocg_1 = 0;
end
lenwm_ycocg = lenwm_ycocg_1 + lenwm_ycocg_2 + lenwm_ycocg_3;
disp( ['Watermarked YCoCgspace: ', num2str(lenwm_ycocg), ' pure watermark bits.'] );

% Combine watermarked integer part and original fractional part
wm_ycocg1 = wm_ycocg + ycocg_f;
% Convert to RGB
ycocg_rgb = ycocg2rgb( wm_ycocg1 ); % This is actual output

%psnr_ybr = PSNR( image, y2rgb );
%psnr_ycocg = PSNR( wm_ycocg, ycocg_i );
psnr_ycocg = PSNR( rgb, ycocg_rgb );

%-----------------------YUV color space------------------------------------
%--------------------------------------------------------------------------

% Transform color space
ycucv = rgb2YCuCv( rgb );

% Separate integer and fractional parts
ycucv_i = floor( ycucv );
ycucv_f = ycucv - ycucv_i;

watermark = randi( [0 1], 1, len_wm );

% Watermark YCoCg space, integer part
wm_ycucv = ycucv_i;
[ wm_ycucv(:,:,2) lenwm_ycucv_2 ov2 ] = EmbedWatermarkInterpolation( ycucv_i(:,:,2), watermark );
if( lenwm_ycucv_2 < len_wm )
    watermark = randi( [0 1], 1, ( len_wm - lenwm_ycucv_2 ) );
    [ wm_ycucv(:,:,3) lenwm_ycucv_3 ov3 ] = EmbedWatermarkInterpolation( ycucv_i(:,:,3), watermark );
else
    lenwm_ycucv_3 = 0;
end
if( ( lenwm_ycucv_3 + lenwm_ycucv_2 ) < len_wm )
    watermark = randi( [0 1], 1, ( len_wm - lenwm_ycucv_3 - lenwm_ycucv_2 ) );
    [ wm_ycucv(:,:,1) lenwm_ycucv_1 ov1 ] = EmbedWatermarkInterpolation( ycucv_i(:,:,1), watermark );
else
    lenwm_ycucv_1 = 0;
end
lenwm_ycucv = lenwm_ycucv_1 + lenwm_ycucv_2 + lenwm_ycucv_3;
disp( ['Watermarked YCuCvspace: ', num2str(lenwm_ycucv), ' pure watermark bits.'] );

% Combine watermarked integer part and original fractional part
wm_ycucv1 = wm_ycucv + ycucv_f;
% Convert to RGB
ycucv_rgb = YCuCv2rgb( wm_ycucv1 ); % This is actual output

%psnr_ybr = PSNR( image, y2rgb );
%psnr_yuv = PSNR( wm_yuv, yuv_i );
psnr_ycucv = PSNR( rgb, ycucv_rgb );

%--------------------------------------o1o2o3 color space------------------
%--------------------------------------------------------------------------

% Transform color space
o1o2o3 = rgb2o1o2o3( rgb );

% Separate integer and fractional parts
o1o2o3_i = floor( o1o2o3 );
o1o2o3_f = o1o2o3 - o1o2o3_i;

watermark = randi( [0 1], 1, len_wm );

% Watermark YCoCg space, integer part
wm_o1o2o3 = o1o2o3_i;
[ wm_o1o2o3(:,:,2) lenwm_o1o2o3_2 ov2 ] = EmbedWatermarkInterpolation( o1o2o3_i(:,:,2), watermark );
if( lenwm_o1o2o3_2 < len_wm )
    watermark = randi( [0 1], 1, ( len_wm - lenwm_o1o2o3_2 ) );
    [ wm_o1o2o3(:,:,3) lenwm_o1o2o3_3 ov3 ] = EmbedWatermarkInterpolation( o1o2o3_i(:,:,3), watermark );
else
    lenwm_o1o2o3_3 = 0;
end
if( ( lenwm_o1o2o3_3 + lenwm_o1o2o3_2 ) < len_wm )
    watermark = randi( [0 1], 1, ( len_wm - lenwm_o1o2o3_3 - lenwm_o1o2o3_2 ) );
    [ wm_o1o2o3(:,:,1) lenwm_o1o2o3_1 ov1 ] = EmbedWatermarkInterpolation( o1o2o3_i(:,:,1), watermark );
else
    lenwm_o1o2o3_1 = 0;
end
lenwm_o1o2o3 = lenwm_o1o2o3_1 + lenwm_o1o2o3_2 + lenwm_o1o2o3_3;
disp( ['Watermarked YCuCvspace: ', num2str(lenwm_o1o2o3), ' pure watermark bits.'] );

% Combine watermarked integer part and original fractional part
wm_o1o2o31 = wm_o1o2o3 + o1o2o3_f;
% Convert to RGB
o1o2o3_rgb = o1o2o32rgb( wm_o1o2o31 ); % This is actual output

%psnr_ybr = PSNR( image, y2rgb );
%psnr_yuv = PSNR( wm_yuv, yuv_i );
psnr_o1o2o3 = PSNR( rgb, o1o2o3_rgb );



end


watermark = randi([0 1], 1, 999999);
image = imread('ballon.jpg');

% % image_YCoCg = rgb2YCoCg(image);
% % %%%%Embed
% % [ watermarked_image len_wm overhead ] = EmbedWatermarkInterpolation( image, watermark );
% % %%%%Extract
% % [ retrieved_image watermark ] = ExtractWatermarkInterpolation( watermarked_image, len_wm, overhead );
% 
% %[rgb_wm ycocg_wm lenwm_rgb lenwm_ycocg] =Color_watermark(image,watermark);


 rgb = double( image );

[ nr nc nl ] = size( rgb );

% Watermark RGB space
wm_rgb = zeros( nr, nc, nl );
[ wm_rgb(:,:,1) lenwm_rgb_1 ov1 ] = EmbedWatermarkInterpolation( rgb(:,:,1), watermark );
[ wm_rgb(:,:,2) lenwm_rgb_2 ov2 ] = EmbedWatermarkInterpolation( rgb(:,:,2), watermark );
[ wm_rgb(:,:,3) lenwm_rgb_3 ov3 ] = EmbedWatermarkInterpolation( rgb(:,:,3), watermark );
lenwm_rgb = lenwm_rgb_1 + lenwm_rgb_2 + lenwm_rgb_3;
disp( ['Watermarked RGB space: ', num2str(lenwm_rgb), ' pure watermark bits.']  );
figure(1), imshow(wm_rgb./max(max(max(wm_rgb))));

PSNR(rgb, wm_rgb);

% At Receiver side---------------------------------------------------------

% Extract Watermark from RGB Space
ret_rgb = zeros( nr, nc, nl );
[ ret_rgb(:,:,1) wmr1 ] = ExtractWatermarkInterpolation( wm_rgb(:,:,1), lenwm_rgb_1, ov1 );
[ ret_rgb(:,:,2) wmr2 ] = ExtractWatermarkInterpolation( wm_rgb(:,:,2), lenwm_rgb_2, ov2 );
[ ret_rgb(:,:,3) wmr3 ] = ExtractWatermarkInterpolation( wm_rgb(:,:,3), lenwm_rgb_3, ov3 );
disp( 'Extracted Watermarked from RGB space' );

iseq( ret_rgb, rgb );
iseq( watermark( 1, 1:numel( wmr1 ) ), wmr1 );
iseq( watermark( 1, 1:numel( wmr2 ) ), wmr2 );
iseq( watermark( 1, 1:numel( wmr3 ) ), wmr3 );
disp(' ');

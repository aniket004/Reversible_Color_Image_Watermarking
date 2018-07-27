

watermark = randi([0 1], 1, 999999);
image = imread('lena.tiff');
figure(1), imshow(image); title('Original image');

tic;
rgb = double(image);
ycocg = rgb2ycocg(rgb);

% figure(1), imshow(ycocg(:,:,1)/max(max(ycocg(:,:,1))));
% figure(2), imshow(ycocg(:,:,2)/max(max(ycocg(:,:,2))));
% figure(3), imshow(ycocg(:,:,3)/max(max(ycocg(:,:,3))));

 ycocg = double( ycocg );

[ nr nc nl ] = size( ycocg );

% Watermark YCoCg space
wm_ycocg = zeros( nr, nc, nl );
[ wm_ycocg(:,:,1) lenwm_ycocg_1 ov1 ] = EmbedWatermarkInterpolation( ycocg(:,:,1), watermark );
[ wm_ycocg(:,:,2) lenwm_ycocg_2 ov2 ] = EmbedWatermarkInterpolation( ycocg(:,:,2), watermark );
[ wm_ycocg(:,:,3) lenwm_ycocg_3 ov3 ] = EmbedWatermarkInterpolation( ycocg(:,:,3), watermark );
lenwm_ycocg = lenwm_ycocg_1 + lenwm_ycocg_2 + lenwm_ycocg_3;
disp( ['Watermarked YCoCg space: ', num2str(lenwm_ycocg), ' pure watermark bits.']  );

rgb_wm = ycocg2rgb(wm_ycocg);
 figure(2), imshow(rgb_wm./max(max(max(rgb_wm)))); title('watermarked image');
 %figure(2), imshow(rgb_wm); title('watermarked image');
% PSNR(rgb, rgb_wm);

% At Receiver side---------------------------------------------------------

% Extract Watermark from YCoCg Space

wm_ycocg = rgb2ycocg(rgb_wm);
ret_ycocg = zeros( nr, nc, nl );
[ ret_ycocg(:,:,1) wmr1 ] = ExtractWatermarkInterpolation( wm_ycocg(:,:,1), lenwm_ycocg_1, ov1 );
[ ret_ycocg(:,:,2) wmr2 ] = ExtractWatermarkInterpolation( wm_ycocg(:,:,2), lenwm_ycocg_2, ov2 );
[ ret_ycocg(:,:,3) wmr3 ] = ExtractWatermarkInterpolation( wm_ycocg(:,:,3), lenwm_ycocg_3, ov3 );
ret_rgb = YCoCg2rgb(ret_ycocg);

toc

figure(3), imshow(ret_rgb/max(max(max(ret_rgb)))); title('Retrived image');

disp( 'Extracted Watermarked from RGB space' );

iseq( ret_rgb, rgb );
iseq( watermark( 1, 1:numel( wmr1 ) ), wmr1 );
iseq( watermark( 1, 1:numel( wmr2 ) ), wmr2 );
iseq( watermark( 1, 1:numel( wmr3 ) ), wmr3 );
disp(' ');


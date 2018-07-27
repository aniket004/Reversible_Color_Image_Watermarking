function [ wm_rgb wm_ycocg lenwm_rgb lenwm_ycocg ] = Color_watermark( image, watermark )
%function [ wm_rgb wm_ybr lenwm_rgb lenwm_ybr ] = Color_watermark( image, watermark )
%Color image watermarking

if ( ischar( image ) == 1 )
    % If input image is the name of the image file
    rgb = imread( image );
    rgb = double( rgb );
else
    % If input image is the pixel matrix itself
    rgb = double( image );
end
[ nr nc nl ] = size( rgb );

% Watermark RGB space
wm_rgb = zeros( nr, nc, nl );
[ wm_rgb(:,:,1) lenwm_rgb_1 ov1 ] = EmbedWatermarkInterpolation( rgb(:,:,1), watermark );
[ wm_rgb(:,:,2) lenwm_rgb_2 ov2 ] = EmbedWatermarkInterpolation( rgb(:,:,2), watermark );
[ wm_rgb(:,:,3) lenwm_rgb_3 ov3 ] = EmbedWatermarkInterpolation( rgb(:,:,3), watermark );
lenwm_rgb = lenwm_rgb_1 + lenwm_rgb_2 + lenwm_rgb_3;
disp( ['Watermarked RGB space: ', num2str(lenwm_rgb), ' pure watermark bits.']  );

% % % At Receiver side---------------------------------------------------------
% % 
% % % Extract Watermark from RGB Space
% % ret_rgb = zeros( nr, nc, nl );
% % [ ret_rgb(:,:,1) wmr1 ] = ExtractWatermarkInterpolation( wm_rgb(:,:,1), lenwm_rgb_1, ov1 );
% % [ ret_rgb(:,:,2) wmr2 ] = ExtractWatermarkInterpolation( wm_rgb(:,:,2), lenwm_rgb_2, ov2 );
% % [ ret_rgb(:,:,3) wmr3 ] = ExtractWatermarkInterpolation( wm_rgb(:,:,3), lenwm_rgb_3, ov3 );
% % disp( 'Extracted Watermarked from RGB space' );
% % 
% % iseq( ret_rgb, rgb );
% % iseq( watermark( 1, 1:numel( wmr1 ) ), wmr1 );
% % iseq( watermark( 1, 1:numel( wmr2 ) ), wmr2 );
% % iseq( watermark( 1, 1:numel( wmr3 ) ), wmr3 );
% % disp(' ');

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

% Transform color space
ycocg = rgb2ycocg( rgb );

% Separate integer and fractional parts
ycocg_i = floor( ycocg );
ycocg_f = ycocg - ycocg_i;

% Watermark YCoCg space, integer part
wm_ycocg = zeros( nr, nc, nl );
[ wm_ycocg(:,:,1) lenwm_ycocg_1 ov1 ] = EmbedWatermarkInterpolation( ycocg_i(:,:,1), watermark );
[ wm_ycocg(:,:,2) lenwm_ycocg_2 ov2 ] = EmbedWatermarkInterpolation( ycocg_i(:,:,2), watermark );
[ wm_ycocg(:,:,3) lenwm_ycocg_3 ov3 ] = EmbedWatermarkInterpolation( ycocg_i(:,:,3), watermark );
lenwm_ycocg = lenwm_ycocg_1 + lenwm_ycocg_2 + lenwm_ycocg_3;

% Combine watermarked integer part and original fractional part
wm_ycocg1 = wm_ycocg + ycocg_f;

% Convert to RGB
wm_ycocg = ycocg2rgb( wm_ycocg1 ); % This is actual output
disp( ['Watermarked YCoCgspace: ', num2str(lenwm_ycocg), ' pure watermark bits.'] );

% % % At Receiver side---------------------------------------------------------
% % 
% % % Again convert to YCbCr Space
% % r2ybr = rgb2ybr( y2rgb );
% % %iseq( r2ybr, wm_ybr1 ); % Check
% % 
% % % Separate integer and fractional parts
% % % wm_ybr_i = floor( r2ybr ); % wm_ybr; <---- 
% % % wm_ybr_f = r2ybr - wm_ybr_i; % ybr_f; <---- 
% % wm_ybr_i = wm_ybr; 
% % wm_ybr_f = ybr_f; 
% % 
% % % Extract Watermark from YCbCr Space, from integer part
% % ret_ybr = zeros( nr, nc, nl );
% % [ ret_ybr(:,:,1) wmy1 ] = ExtractWatermarkInterpolation( wm_ybr_i(:,:,1), lenwm_ybr_1, ov1 );
% % [ ret_ybr(:,:,2) wmy2 ] = ExtractWatermarkInterpolation( wm_ybr_i(:,:,2), lenwm_ybr_2, ov2 );
% % [ ret_ybr(:,:,3) wmy3 ] = ExtractWatermarkInterpolation( wm_ybr_i(:,:,3), lenwm_ybr_3, ov3 );
% % 
% % % Combine retrieved integer part and original fractional part
% % ret_ybr1 = ret_ybr + wm_ybr_f;
% % disp( 'Extracted Watermarked from YCbCr space' );
% % 
% % % Finally convert back to RGB space
% % ret_y2rgb = ybr2rgb( ret_ybr1 ); % This is actual output
% % 
% % % iseq( ret_ybr, rgb );
% % iseq( ret_ybr, ybr_i );
% % iseq( watermark( 1, 1:numel( wmy1 ) ), wmy1 );
% % iseq( watermark( 1, 1:numel( wmy2 ) ), wmy2 );
% % iseq( watermark( 1, 1:numel( wmy3 ) ), wmy3 );
% % disp(' ');

end


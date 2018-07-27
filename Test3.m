function [ ] = Test3( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

wm = randi( [0 1], 1, 9999999 );
disp('%%%%%%%%%%%%%%%%%%%%%%%%')        
% disp('LENA')
% [ psnr_rgb psnr_ycocg psnr_ycucv lenwm_rgb lenwm_ycocg lenwm_ycucv ] = Color_watermark_data( 'lena.tiff',wm );

% disp(' ');
disp('MANDRILL')
[ psnr_rgb psnr_ycocg psnr_ycucv lenwm_rgb lenwm_ycocg lenwm_ycucv ] = Color_watermark_data( 'mandrill.tiff',wm);

disp(' ');
disp('PEPPER')
[ psnr_rgb psnr_ycocg psnr_ycucv lenwm_rgb lenwm_ycocg lenwm_ycucv ] = Color_watermark_data( 'pepper.tiff',wm );
disp(' ');
% disp('CAR')
% [ wpsnr_rgb psnr_ycocg psnr_ycucv lenwm_rgb lenwm_ycocg lenwm_ycucv ] = Color_watermark_data( 'car.tiff',wm );
% disp(' ');
% disp('PLANE')
% [ psnr_rgb psnr_ycocg psnr_ycucv lenwm_rgb lenwm_ycocg lenwm_ycucv ] = Color_watermark_data( 'plane.tiff',wm );
% disp(' ');
disp('SAILBOAT')
[ psnr_rgb psnr_ycocg psnr_ycucv lenwm_rgb lenwm_ycocg lenwm_ycucv ] = Color_watermark_data( 'sailboat.tiff',wm );
disp(' ');
% disp('JELLYBEANS')
% [ psnr_rgb psnr_ycocg psnr_ycucv lenwm_rgb lenwm_ycocg lenwm_ycucv ] = Color_watermark_data( 'jellybeans.tiff' ,wm);
% disp(' ');
% disp('SPLASH')
% [ psnr_rgb psnr_ycocg psnr_ycucv lenwm_rgb lenwm_ycocg lenwm_ycucv ] = Color_watermark_data( 'splash.tiff',wm );
% disp(' ');
% disp('ZELDA')
% [ psnr_rgb psnr_ycocg psnr_ycucv lenwm_rgb lenwm_ycocg lenwm_ycucv ] = Color_watermark_data( 'zelda.tiff',wm );
% disp(' ');
disp('BARBARA')
[ psnr_rgb psnr_ycocg psnr_ycucv lenwm_rgb lenwm_ycocg lenwm_ycucv ] = Color_watermark_data( 'barbara.jpg',wm );
disp(' ');
disp('GOLDHILL')
[ psnr_rgb psnr_ycocg psnr_ycucv lenwm_rgb lenwm_ycocg lenwm_ycucv ] = Color_watermark_data( 'goldhill.jpg',wm );
disp(' ');
disp('BOAT')
[ psnr_rgb psnr_ycocg psnr_ycucv lenwm_rgb lenwm_ycocg lenwm_ycucv ] = Color_watermark_data( 'boat.jpg',wm );
disp(' ');
% disp('VEGETABLE')
% [ psnr_rgb psnr_ycocg psnr_ycucv lenwm_rgb lenwm_ycocg lenwm_ycucv ] = Color_watermark_data( 'vegetable.jpg',wm );
% disp(' ');
disp('ROSE')
[ psnr_rgb psnr_ycocg psnr_ycucv lenwm_rgb lenwm_ycocg lenwm_ycucv ] = Color_watermark_data( 'rose.jpg',wm );
disp(' ');
% disp('BALLON')
% [ psnr_rgb psnr_ycocg psnr_ycucv lenwm_rgb lenwm_ycocg lenwm_ycucv ] = Color_watermark_data( 'ballon.jpg',wm );
% disp(' ');
end


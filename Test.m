function [ ] = Test( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

wm = randi( [0 1], 1, 9999999 );
disp('%%%%%%%%%%%%%%%%%%%%%%%%')
disp('LENA')
[ wm_rgb y2rgb ] = Color_watermark( 'lena.tiff', wm );
disp(' ');
disp('MANDRILL')
[ wm_rgb y2rgb ] = Color_watermark( 'mandrill.tiff', wm );
disp(' ');
disp('PEPPER')
[ wm_rgb y2rgb ] = Color_watermark( 'pepper.tiff', wm );
disp(' ');
disp('CAR')
[ wm_rgb y2rgb ] = Color_watermark( 'car.tiff', wm );
disp(' ');
disp('PLANE')
[ wm_rgb y2rgb ] = Color_watermark( 'plane.tiff', wm );
disp(' ');
disp('SAILBOAT')
[ wm_rgb y2rgb ] = Color_watermark( 'sailboat.tiff', wm );
disp(' ');
disp('JELLYBEANS')
[ wm_rgb y2rgb ] = Color_watermark( 'jellybeans.tiff', wm );
disp(' ');
disp('SPLASH')
[ wm_rgb y2rgb ] = Color_watermark( 'splash.tiff', wm );
disp(' ');
disp('ZELDA')
[ wm_rgb y2rgb ] = Color_watermark( 'zelda.tiff', wm );
disp(' ');
disp('PEPPER')
[ wm_rgb y2rgb ] = Color_watermark( 'pepper.tiff', wm );
disp(' ');
disp('BARBARA')
[ wm_rgb y2rgb ] = Color_watermark( 'barbara.jpg', wm );
disp(' ');
disp('GOLDHILL')
[ wm_rgb y2rgb ] = Color_watermark( 'goldhill.jpg', wm );
disp(' ');
disp('BOAT')
[ wm_rgb y2rgb ] = Color_watermark( 'boat.jpg', wm );
disp(' ');
disp('VEGETABLE')
[ wm_rgb y2rgb ] = Color_watermark( 'vegetable.jpg', wm );
disp(' ');
disp('ROSE')
[ wm_rgb y2rgb ] = Color_watermark( 'rose.jpg', wm );
disp(' ');
disp('BALLON')
[ wm_rgb y2rgb ] = Color_watermark( 'ballon.jpg', wm );
disp(' ');
end


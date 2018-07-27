function [ ] = Test1( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

wm = randi( [0 1], 1, 9999999 );
disp('%%%%%%%%%%%%%%%%%%%%%%%%')
% disp('LENA')
% [ wm_rgb ycocg_rgb ycucv_rgb ] = Plot_Color( 'lena.tiff' );
% disp(' ');
disp('MANDRILL')
[ wm_rgb ycocg_rgb ycucv_rgb ] = Plot_Color( 'mandrill.tiff');
disp(' ');
disp('PEPPER')
[ wm_rgb ycocg_rgb ycucv_rgb ] = Plot_Color( 'pepper.tiff' );
disp(' ');
% disp('CAR')
% [ wm_rgb ycocg_rgb ycucv_rgb ] = Plot_Color( 'car.tiff' );
% disp(' ');
% disp('PLANE')
% [ wm_rgb ycocg_rgb ycucv_rgb ] = Plot_Color( 'plane.tiff' );
% disp(' ');
disp('SAILBOAT')
[ wm_rgb ycocg_rgb ycucv_rgb ] = Plot_Color( 'sailboat.tiff' );
disp(' ');
% disp('JELLYBEANS')
% [ wm_rgb ycocg_rgb ycucv_rgb ] = Plot_Color( 'jellybeans.tiff' );
% disp(' ');
% disp('SPLASH')
% [ wm_rgb ycocg_rgb ycucv_rgb ] = Plot_Color( 'splash.tiff' );
% disp(' ');
% disp('ZELDA')
% [ wm_rgb ycocg_rgb ycucv_rgb ] = Plot_Color( 'zelda.tiff' );
% disp(' ');
disp('BARBARA')
[ wm_rgb ycocg_rgb ycucv_rgb ] = Plot_Color( 'barbara.jpg' );
disp(' ');
disp('GOLDHILL')
[ wm_rgb ycocg_rgb ycucv_rgb ] = Plot_Color( 'goldhill.jpg' );
disp(' ');
disp('BOAT')
[ wm_rgb ycocg_rgb ycucv_rgb ] = Plot_Color( 'boat.jpg' );
disp(' ');
% disp('VEGETABLE')
% [ wm_rgb ycocg_rgb ycucv_rgb ] = Plot_Color( 'vegetable.jpg' );
% disp(' ');
disp('ROSE')
[ wm_rgb ycocg_rgb ycucv_rgb ] = Plot_Color( 'rose.jpg' );
disp(' ');
% disp('BALLON')
% [ wm_rgb ycocg_rgb ycucv_rgb ] = Plot_Color( 'ballon.jpg' );
% disp(' ');
end


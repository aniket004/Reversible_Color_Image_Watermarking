function [ ] = Test6( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

wm = randi( [0 1], 1, 9999999 );
disp('%%%%%%%%%%%%%%%%%%%%%%%%')
disp('BIRD')
[ psnr_rgb psnr_ycocg psnr_ycucv psnr_o1o2o3 lenwm_rgb lenwm_ycocg lenwm_ycucv lenwm_o1o2o3] = Color_watermark_data( 'bird.png',wm );
disp(' ');
disp('CAP')
[ psnr_rgb psnr_ycocg psnr_ycucv psnr_o1o2o3 lenwm_rgb lenwm_ycocg lenwm_ycucv lenwm_o1o2o3] = Color_watermark_data( 'cap.png',wm );
disp(' ');
disp('CYCLE')
[ psnr_rgb psnr_ycocg psnr_ycucv psnr_o1o2o3 lenwm_rgb lenwm_ycocg lenwm_ycucv lenwm_o1o2o3] = Color_watermark_data( 'cycle.png',wm );
disp(' ');
disp('HOUSE')
[ psnr_rgb psnr_ycocg psnr_ycucv psnr_o1o2o3 lenwm_rgb lenwm_ycocg lenwm_ycucv lenwm_o1o2o3] = Color_watermark_data( 'house.png',wm );
disp(' ');
% disp('AIRPLANE')
% [ psnr_rgb psnr_ycocg psnr_ycucv psnr_o1o2o3 lenwm_rgb lenwm_ycocg lenwm_ycucv lenwm_o1o2o3] = Color_watermark_data( 'airplane.png',wm );
% disp(' ');
% disp('SCENE')
% [ psnr_rgb psnr_ycocg psnr_ycucv psnr_o1o2o3 lenwm_rgb lenwm_ycocg lenwm_ycucv lenwm_o1o2o3] = Color_watermark_data( 'scene.png',wm );
% disp(' ');
disp('SEA')
[ psnr_rgb psnr_ycocg psnr_ycucv psnr_o1o2o3 lenwm_rgb lenwm_ycocg lenwm_ycucv lenwm_o1o2o3] = Color_watermark_data( 'sea.png',wm );
disp(' ');
disp('TOWER')
[ psnr_rgb psnr_ycocg psnr_ycucv psnr_o1o2o3 lenwm_rgb lenwm_ycocg lenwm_ycucv lenwm_o1o2o3] = Color_watermark_data( 'tower.png',wm );
disp(' ');
% disp('BUILDING')
% [ psnr_rgb psnr_ycocg psnr_ycucv psnr_o1o2o3 lenwm_rgb lenwm_ycocg lenwm_ycucv lenwm_o1o2o3] = Color_watermark_data( 'building.png',wm );
% disp(' ');
% disp('COLORBOAT')
% [ psnr_rgb psnr_ycocg psnr_ycucv psnr_o1o2o3 lenwm_rgb lenwm_ycocg lenwm_ycucv lenwm_o1o2o3] = Color_watermark_data( 'colorboat.png',wm );
% disp(' ');
% disp('HOTEL')
% [ psnr_rgb psnr_ycocg psnr_ycucv psnr_o1o2o3 lenwm_rgb lenwm_ycocg lenwm_ycucv lenwm_o1o2o3] = Color_watermark_data( 'hotel.png',wm );
% disp(' ');
% disp('MEN')
% [ psnr_rgb psnr_ycocg psnr_ycucv psnr_o1o2o3 lenwm_rgb lenwm_ycocg lenwm_ycucv lenwm_o1o2o3] = Color_watermark_data( 'men.png',wm );
disp(' ');
disp('NATURE')
[ psnr_rgb psnr_ycocg psnr_ycucv psnr_o1o2o3 lenwm_rgb lenwm_ycocg lenwm_ycucv lenwm_o1o2o3] = Color_watermark_data( 'nature.png',wm );
disp(' ');
end


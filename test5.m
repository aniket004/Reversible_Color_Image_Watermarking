function [ ] = Test5( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

wm = randi( [0 1], 1, 9999999 );
disp('%%%%%%%%%%%%%%%%%%%%%%%%')
disp('BIRD')
[ wm_rgb ycocg_rgb ycucv_rgb o1o2o3_rgb] = Plot_Color( 'bird.png' );
disp(' ');
disp('CAP')
[ wm_rgb ycocg_rgb ycucv_rgb o1o2o3_rgb] = Plot_Color( 'cap.png');
disp(' ');
disp('CYCLE')
[ wm_rgb ycocg_rgb ycucv_rgb o1o2o3_rgb] = Plot_Color( 'cycle.png' );
disp(' ');
disp('HOUSE')
[ wm_rgb ycocg_rgb ycucv_rgb o1o2o3_rgb] = Plot_Color( 'house.png' );
disp(' ');
% disp('AIRPLANE')
% [ wm_rgb ycocg_rgb ycucv_rgb o1o2o3_rgb] = Plot_Color( 'airplane.png' );
% disp(' ');
% disp('SCENE')
% [ wm_rgb ycocg_rgb ycucv_rgb o1o2o3_rgb] = Plot_Color( 'scene.png' );
% disp(' ');
disp('SEA')
[ wm_rgb ycocg_rgb ycucv_rgb o1o2o3_rgb] = Plot_Color( 'sea.png' );
disp(' ');
disp('TOWER')
% [ wm_rgb ycocg_rgb ycucv_rgb o1o2o3_rgb] = Plot_Color( 'tower.png' );
% disp(' ');
% disp('BUILDING')
% [ wm_rgb ycocg_rgb ycucv_rgb o1o2o3_rgb] = Plot_Color( 'building.png' );
% disp(' ');
% disp('COLORBOAT')
% [ wm_rgb ycocg_rgb ycucv_rgb o1o2o3_rgb] = Plot_Color( 'colorboat.png' );
% disp(' ');
% disp('HOTEL')
% [ wm_rgb ycocg_rgb ycucv_rgb o1o2o3_rgb] = Plot_Color( 'hotel.png' );
% disp(' ');
% disp('MEN')
% [ wm_rgb ycocg_rgb ycucv_rgb o1o2o3_rgb] = Plot_Color( 'men.png' );
% disp(' ');
disp('NATURE')
[ wm_rgb ycocg_rgb ycucv_rgb o1o2o3_rgb] = Plot_Color( 'nature.png' );
disp(' ');
end


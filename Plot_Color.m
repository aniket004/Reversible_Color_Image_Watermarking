function [ psnr_rgb_array psnr_ycocg_array psnr_ycucv_array psnr_o1o2o3_array bpp_rgb_array bpp_ycocg_array bpp_ycucv_array bpp_o1o2o3_array ] = Plot_Color( image )
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

% Initialization
psnr_rgb_array = [ ];
psnr_ycocg_array = [ ];
psnr_ycucv_array = [ ];
psnr_o1o2o3_array = [ ];

bpp_rgb_array = [ ];
bpp_ycocg_array = [ ];
bpp_ycucv_array = [ ];
bpp_o1o2o3_array = [ ];

for bpp = 0.05:0.05:2
    disp(num2str(bpp));
    len_wm = floor( bpp*nr*nc );
    [ psnr_rgb psnr_ycocg psnr_ycucv psnr_o1o2o3 lenwm_rgb lenwm_ycocg lenwm_ycucv lenwm_o1o2o3] = Color_watermark_data( image, len_wm );
    psnr_rgb_array = horzcat( psnr_rgb_array, psnr_rgb );
    psnr_ycocg_array = horzcat( psnr_ycocg_array, psnr_ycocg );
    psnr_ycucv_array = horzcat( psnr_ycucv_array, psnr_ycucv );
    psnr_o1o2o3_array = horzcat( psnr_o1o2o3_array, psnr_o1o2o3 );
    
    bpp_rgb = lenwm_rgb / ( nr*nc );
    bpp_rgb_array = horzcat( bpp_rgb_array, bpp_rgb );
    bpp_ycocg = lenwm_ycocg / ( nr*nc );
    bpp_ycocg_array = horzcat( bpp_ycocg_array, bpp_ycocg );
    bpp_ycucv = lenwm_ycucv / (nr*nc);
    bpp_ycucv_array = horzcat( bpp_ycucv_array, bpp_ycucv );
    bpp_o1o2o3 = lenwm_o1o2o3 / (nr*nc);
    bpp_o1o2o3_array = horzcat( bpp_o1o2o3_array, bpp_o1o2o3 );
    
    
    if( ( len_wm > lenwm_rgb ) && ( len_wm > lenwm_ycocg ) &&( len_wm > lenwm_ycucv ) && ( len_wm > lenwm_o1o2o3 ))
        break;
    end
    disp(' ');
end

% Plot
% figure1 = figure;
% axes1 = axes('Parent',figure1,'FontWeight','bold','FontSize',24);
% xlim(axes1,[-100 100]);
% ylim(axes1,[0 3.5e+004]);
% box(axes1,'on');
% hold(axes1,'all');
% title('image','FontWeight','bold','FontSize',24);
%  figure; plot(bpp_rgb_array,psnr_rgb_array);
%  hold on; plot(bpp_rgb_array,psnr_ycocg_array,'r'); hold off;
 figure;
 axes1 = axes('Parent',figure,'FontWeight','bold','FontSize',24);
 box(axes1,'on');
 hold(axes1,'all');
 xlabel('Embedded bpp','FontWeight','bold','FontSize',24);
 ylabel('PSNR(db)','FontWeight','bold','FontSize',24);
 plot(bpp_rgb_array,psnr_rgb_array,'b');
 hold on; plot(bpp_ycocg_array,psnr_ycocg_array,'r'); hold off;
 hold on; plot(bpp_ycucv_array,psnr_ycucv_array,'g');hold off;
 hold on; plot(bpp_o1o2o3_array,psnr_o1o2o3_array,'y');hold off;
%legends('RGB','YCoCg');



end


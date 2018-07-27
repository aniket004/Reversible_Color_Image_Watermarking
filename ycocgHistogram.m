function [ ycocg_wm peak_y_value peak_co_value peak_cg_value embedded_bits ] = ycocgHistogram( ybr, b )
%YCbCr Histogram Bin Shifting Test

ybr = double( ybr );
[nr nc ns] = size( ybr );

% TRUNCATE----------------------------------------------------------------

sgn = sign( ybr );
for i = 1:nr
    for j = 1:nc
        for k = 1:ns
            if( sgn(i,j,k) == 0 )
                sgn(i,j,k) = 1;
            end
        end
    end
end
absl = abs( ybr );
coeff = floor( absl );
details = abs( ybr ) - floor( absl );

% CREATE HISTOGRAMS-------------------------------------------------------

% min( min( coeff ) )
% max( max( coeff ) )

hist_y = zeros(1,256);
hist_cb = zeros(1,256);
hist_cr = zeros(1,256);
for i = 1:nr
    for j = 1:nc
        pos_y = coeff(i,j,1); %Range of pixel values from 0-255
        pos_y = pos_y + 1; %Since range of histogramogram is from 1-256
        hist_y( 1, pos_y ) = hist_y( 1, pos_y ) + 1;
    end
end
for i = 1:nr
    for j = 1:nc
        pos_cb = coeff(i,j,2); %Range of pixel values from 0-255
        pos_cb = pos_cb + 1; %Since range of histogramogram is from 1-256
        hist_cb( 1, pos_cb ) = hist_cb( 1, pos_cb ) + 1;
    end
end
for i = 1:nr
    for j = 1:nc
        pos_cr = coeff(i,j,3); %Range of pixel values from 0-255
        pos_cr = pos_cr + 1; %Since range of histogramogram is from 1-256
        hist_cr( 1, pos_cr ) = hist_cr( 1, pos_cr ) + 1;
    end
end

disp( [ '255th Y frequency: ', num2str( hist_y(1,256) ) ] )
disp( [ '255th Cb frequency: ', num2str( hist_cb(1,256) ) ] )
disp( [ '255th Cr frequency: ', num2str( hist_cr(1,256) ) ] )
disp(' ')

%DISPLAY HISTOGRAMS-------------------------------------------------------

% for j = 1:256
%     disp(['hist_y(',num2str(j-1),') -> ',num2str( hist_y(1,j) )])
% end
% for j = 1:256
%     disp(['hist_cb(',num2str(j-1),') -> ',num2str( hist_cb(1,j) )])
% end
% for j = 1:256
%     disp(['hist_cr(',num2str(j-1),') -> ',num2str( hist_cr(1,j) )])
% end

%Plot histogram
% figure
% stem(0:255, hist_y,'MarkerSize',10,'MarkerFaceColor',[1 0 0],...
%    'MarkerEdgeColor',[1 0 0],...
%    'Marker','.',...
%    'Color',[0 0 1]);
% title('Histogram of Y','FontSize',24)
% grid
% 
% figure
% stem(0:255, hist_cb,'MarkerSize',10,'MarkerFaceColor',[1 0 0],...
%     'MarkerEdgeColor',[1 0 0],...
%     'Marker','.',...
%     'Color',[0 0 1]);
% title('Histogram of Cb','FontSize',24)
% grid
% 
% figure
% stem(0:255, hist_cr,'MarkerSize',10,'MarkerFaceColor',[1 0 0],...
%     'MarkerEdgeColor',[1 0 0],...
%     'Marker','.',...
%     'Color',[0 0 1]);
% title('Histogram of Cr','FontSize',24)
% grid

% FIND PEAK VALUES--------------------------------------------------------

peak_y = 0; %maximum no. of pixels having a particular grayscale
peak_pos_y = 1; %(grayscale having peak (max) no. of pixels) + 1
for j = 1:256
    if( hist_y(1,j) > peak_y )
        peak_y = hist_y(1,j);
        peak_pos_y = j;
    end
end
peak_y_value = peak_pos_y - 1; %grayscale having peak (max) no. of pixels
disp(['PEAK_Y frequency: ',num2str(peak_y)])

peak_cb = 0; %maximum no. of pixels having a particular grayscale
peak_pos_cb = 1; %(grayscale having peak (max) no. of pixels) + 1
for j = 1:256
    if( hist_cb(1,j) > peak_cb )
        peak_cb = hist_cb(1,j);
        peak_pos_cb = j;
    end
end
peak_co_value = peak_pos_cb - 1; %grayscale having peak (max) no. of pixels
disp(['PEAK_Cb frequency: ',num2str(peak_cb)])

peak_cr = 0; %maximum no. of pixels having a particular grayscale
peak_pos_cr = 1; %(grayscale having peak (max) no. of pixels) + 1
for j = 1:256
    if( hist_cr(1,j) > peak_cr )
        peak_cr = hist_cr(1,j);
        peak_pos_cr = j;
    end
end
peak_cg_value = peak_pos_cr - 1; %grayscale having peak (max) no. of pixels
disp(['PEAK_Cr frequency: ',num2str(peak_cr)])

peak_ybr = peak_y + peak_cb + peak_cr;
disp(['PEAK_YCbCr frequency: ',num2str(peak_ybr)])

% RIGHT SHIFT & EMBED ----------------------------------------------------

im_wm = coeff;
% b = randi([0 1],1,100000);
[widb lenb] = size(b);
b_pos = 1;
embedded_bits = peak_ybr;

for i = 1:nr
    for j = 1:nc
        if( b_pos <= lenb )
            if( coeff(i,j,3) == peak_cg_value )
                im_wm(i,j,3) = coeff(i,j,3) + b(1,b_pos); %embed
                b_pos = b_pos + 1;
            elseif( coeff(i,j,3) > peak_cg_value )
                im_wm(i,j,3) = coeff(i,j,3) + 1;
            end
        end
        if( b_pos == lenb )
            embedded_bits = b_pos;
        end
    end
end
for i = 1:nr
    for j = 1:nc
        if( b_pos <= lenb )
            if( coeff(i,j,2) == peak_co_value )
                im_wm(i,j,2) = coeff(i,j,2) + b(1,b_pos); %embed
                b_pos = b_pos + 1;
            elseif( coeff(i,j,2) > peak_co_value )
                im_wm(i,j,2) = coeff(i,j,2) + 1;
            end
        end
        if( b_pos == lenb )
            embedded_bits = b_pos;
        end
    end
end
for i = 1:nr
    for j = 1:nc
        if( b_pos <= lenb )
            if( coeff(i,j,1) == peak_y_value )
                im_wm(i,j,1) = coeff(i,j,1) + b(1,b_pos); %embed
                b_pos = b_pos + 1;
            elseif( coeff(i,j,1) > peak_y_value )
                im_wm(i,j,1) = coeff(i,j,1) + 1;
            end
        end
        if( b_pos == lenb )
            embedded_bits = b_pos;
        end
    end
end

disp(['Embedded: ', num2str(embedded_bits) ,' bits.'])
ycocg_wm = sgn.*( im_wm + details );

ycocg_rgb_wm = ycocg2rgb( ycocg_wm );

%figure
imsave( imshow( uint8( ycocg_rgb_wm ) ) );

end

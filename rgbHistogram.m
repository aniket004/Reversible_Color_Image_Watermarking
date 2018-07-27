function [ rgb_wm peak_r_value peak_g_value peak_b_value embedded_bits ] = rgbHistogram( rgb, b )
%RGB Histogram Bin Shifting Test

rgb = double( rgb );
[nr nc ns] = size( rgb );

% TRUNCATE----------------------------------------------------------------

sgn = sign( rgb );
absl = abs( rgb );
coeff = floor( absl );
details = abs( rgb ) - floor( absl );

% CREATE HISTOGRAMS-------------------------------------------------------

% min( min( coeff ) )
% max( max( coeff ) )

hist_r = zeros(1,256);
hist_g = zeros(1,256);
hist_b = zeros(1,256);
for i = 1:nr
    for j = 1:nc
        pos_r = coeff(i,j,1); %Range of pixel values from 0-255
        pos_r = pos_r + 1; %Since range of histogramogram is from 1-256
        hist_r( 1, pos_r ) = hist_r( 1, pos_r ) + 1;
    end
end
for i = 1:nr
    for j = 1:nc
        pos_g = coeff(i,j,2); %Range of pixel values from 0-255
        pos_g = pos_g + 1; %Since range of histogramogram is from 1-256
        hist_g( 1, pos_g ) = hist_g( 1, pos_g ) + 1;
    end
end
for i = 1:nr
    for j = 1:nc
        pos_b = coeff(i,j,3); %Range of pixel values from 0-255
        pos_b = pos_b + 1; %Since range of histogramogram is from 1-256
        hist_b( 1, pos_b ) = hist_b( 1, pos_b ) + 1;
    end
end

disp( [ '255th R frequency: ', num2str( hist_r(1,256) ) ] )
disp( [ '255th G frequency: ', num2str( hist_g(1,256) ) ] )
disp( [ '255th B frequency: ', num2str( hist_b(1,256) ) ] )
disp(' ')

%DISPLAY HISTOGRAMS-------------------------------------------------------

% for j = 1:256
%     disp(['hist_r(',num2str(j-1),') -> ',num2str( hist_r(1,j) )])
% end
% for j = 1:256
%     disp(['hist_g(',num2str(j-1),') -> ',num2str( hist_g(1,j) )])
% end
% for j = 1:256
%     disp(['hist_b(',num2str(j-1),') -> ',num2str( hist_b(1,j) )])
% end

%Plot histogram
% figure
% stem(0:255, hist_r,'MarkerSize',10,'MarkerFaceColor',[1 0 0],...
%    'MarkerEdgeColor',[1 0 0],...
%    'Marker','.',...
%    'Color',[0 0 1]);
% title('Histogram of R','FontSize',24)
% grid
% 
% figure
% stem(0:255, hist_g,'MarkerSize',10,'MarkerFaceColor',[1 0 0],...
%     'MarkerEdgeColor',[1 0 0],...
%     'Marker','.',...
%     'Color',[0 0 1]);
% title('Histogram of G','FontSize',24)
% grid
% 
% figure
% stem(0:255, hist_b,'MarkerSize',10,'MarkerFaceColor',[1 0 0],...
%     'MarkerEdgeColor',[1 0 0],...
%     'Marker','.',...
%     'Color',[0 0 1]);
% title('Histogram of B','FontSize',24)
% grid

% FIND PEAK VALUES--------------------------------------------------------

peak_r = 0; %maximum no. of pixels having a particular grayscale
peak_pos_r = 1; %(grayscale having peak (max) no. of pixels) + 1
for j = 1:256
    if( hist_r(1,j) > peak_r )
        peak_r = hist_r(1,j);
        peak_pos_r = j;
    end
end
peak_r_value = peak_pos_r - 1; %grayscale having peak (max) no. of pixels
disp(['PEAK_R frequency: ',num2str(peak_r)])

peak_g = 0; %maximum no. of pixels having a particular grayscale
peak_pos_g = 1; %(grayscale having peak (max) no. of pixels) + 1
for j = 1:256
    if( hist_g(1,j) > peak_g )
        peak_g = hist_g(1,j);
        peak_pos_g = j;
    end
end
peak_g_value = peak_pos_g - 1; %grayscale having peak (max) no. of pixels
disp(['PEAK_G frequency: ',num2str(peak_g)])

peak_b = 0; %maximum no. of pixels having a particular grayscale
peak_pos_b = 1; %(grayscale having peak (max) no. of pixels) + 1
for j = 1:256
    if( hist_b(1,j) > peak_b )
        peak_b = hist_b(1,j);
        peak_pos_b = j;
    end
end
peak_b_value = peak_pos_b - 1; %grayscale having peak (max) no. of pixels
disp(['PEAK_B frequency: ',num2str(peak_b)])

peak_rgb = peak_r + peak_g + peak_b;
disp(['PEAK_RGB frequency: ',num2str(peak_rgb)])

% RIGHT SHIFT & EMBED ----------------------------------------------------

im_wm = coeff;
% b = randi([0 1],1,100000);
[widb lenb] = size(b);
b_pos = 1;
embedded_bits = peak_rgb;

for i = 1:nr
    for j = 1:nc
        if( b_pos <= lenb )
            if( coeff(i,j,1) == peak_r_value )
                im_wm(i,j,1) = coeff(i,j,1) + b(1,b_pos); %embed
                b_pos = b_pos + 1;
            elseif( coeff(i,j,1) > peak_r_value )
                im_wm(i,j,1) = coeff(i,j,1) + 1;
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
            if( coeff(i,j,2) == peak_g_value )
                im_wm(i,j,2) = coeff(i,j,2) + b(1,b_pos); %embed
                b_pos = b_pos + 1;
            elseif( coeff(i,j,2) > peak_g_value )
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
            if( coeff(i,j,3) == peak_b_value )
                im_wm(i,j,3) = coeff(i,j,3) + b(1,b_pos); %embed
                b_pos = b_pos + 1;
            elseif( coeff(i,j,3) > peak_b_value )
                im_wm(i,j,3) = coeff(i,j,3) + 1;
            end
        end
        if( b_pos == lenb )
            embedded_bits = b_pos;
        end
    end
end

disp(['Embedded: ', num2str(embedded_bits) ,' bits.'])

rgb_wm = uint8(im_wm);
%figure
%imsave( imshow( rgb_wm ) );
end

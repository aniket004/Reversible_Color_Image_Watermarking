function [ watermarked_image len_wm overhead ] = EmbedWatermarkInterpolation( image, watermark )
%[ watermarked_image ] = EmbedWatermarkInterpolation( image )
%   Embeds 'watermark' into 'image' using interpolation technique.

if ( ischar(image) == 1 )
    %If input 'image' is the name of the image file 
    p = PrintImageMatrix(image);
else
    %If input 'image' the pixel matrix itself
    p = image;
end
p = double(p);
[nr nc] = size(p);

[ x e ] = Interpolate( p );
[hist LM RM] = CreateErrorHistogram(e);

%Create bitstream to be embedded-------------------------------------------
% Location Map for overflow or underflow.
len_locmap = 0; % Total no. of pixels with values 0, 255, 1, 254.
for i = 1:nr
    for j = 1:nc
        % Only 254 or 1 can change to 255 and 0 respectively
        % So we take max length (for 0,255,1,254)
        % actual loc map consists of those pixel positions which are either
        % 0, 255 or have changed to 0, 255.
        % So actual length may be smaller than len_locmap.
        if( ( p(i,j) == 0 ) || ( p(i,j) == 255 ) || ( p(i,j) == 1 ) || ( p(i,j) == 254 ) )
            len_locmap = len_locmap + 1;
        end
    end
end

%watermarked_image = zeros(nr,nc);
watermarked_image = p;
e_new = e; % Altered errors
poswm = 0; % To keep track of bits to be embedded
cnt = 0; % To find Maximum Embedding capacity
locmap = [ ]; % To prevent overflow/underflow

% Get Maximum Capacity-----------------------------------------------------
for i = 1:nr
    for j = 1:nc
        
        if( ( p(i,j) == 0 ) || ( p(i,j) == 255 ) )            
        else        
            if( e(i,j) == 999 )
            elseif( e(i,j) <= LM )
                if( e(i,j) == LM )
                    cnt = cnt + 1;
                end
            elseif( e(i,j) >= RM )
                if( e(i,j) == RM )
                    cnt = cnt + 1;
                end                
            end            
        end
    end
end

disp( ['Maximum Embedding Capacity : ', num2str( cnt - 18 - len_locmap ), ' bits.'] );
if( numel( watermark ) > ( cnt - 18 - len_locmap ) )
    watermark = watermark( 1, 1:( cnt - 18 - len_locmap ) );
end
len_wm = numel( watermark );

% Store just 18 bits for 2 signed integers along with 'len_locmap' bits for
% overflow/underflow.
k = 1; 
for i = 1:nr
    for j = 1:nc
        if( (i == 1) || (j == 1) || (i == 8) || (j == 8) )
            if( (mod(i,2)==1) && (mod(j,2)==0) )
                if( k <= ( 18 + len_locmap ) )
                    watermark = horzcat( watermark, LSB(p(i,j)) );
                    k = k + 1;
                end
            elseif( (mod(i,2)==0) && (mod(j,2)==1) )
                if( k <= ( 18 + len_locmap ) )
                    watermark = horzcat( watermark, LSB(p(i,j)) );
                    k = k + 1;
                end
            end
        end
    end
end

[nrwm ncwm] = size(watermark);

% Embed--------------------------------------------------------------------
for i = 1:nr
    for j = 1:nc
        
        if( ( p(i,j) == 0 ) || ( p(i,j) == 255 ) )
            locmap = horzcat( locmap, 0 );
            
        else        
            if( e(i,j) == 999 ) % Do not Embed (Low resolution or marginal pixels)
                watermarked_image(i,j) = p(i,j);

            elseif( e(i,j) <= LM )
                sign_e = -1; % sign(e) = -1 if e in LE i.e. <= LM
                if( e(i,j) == LM ) % Embed next bit
                    %cnt = cnt + 1;
                    if( poswm < ncwm ) % More bits to embed
                        poswm = poswm + 1;
                        b = watermark(1,poswm);
                    else
                        b = 0; % No more bits => e will be same
                    end
                    e_new(i,j) = e(i,j) + sign_e * b;
                elseif( e(i,j) < LM ) % Embed 1
                    e_new(i,j) = e(i,j) + sign_e * 1;
                end
                watermarked_image(i,j) = x(i,j) - e_new(i,j);
                % update locmap
                if( ( watermarked_image(i,j) == 0 ) || ( watermarked_image(i,j) == 255 ) )
                    locmap = horzcat( locmap, 1 );
                end

            elseif( e(i,j) >= RM )
                sign_e = 1; % sign(e) = 1 if e in RE i.e. <= RM
                if( e(i,j) == RM ) % Embed next bit
                    %cnt = cnt + 1;
                    if( poswm < ncwm ) % More bits to embed
                        poswm = poswm + 1;
                        b = watermark(1,poswm);
                    else
                        b = 0;  % No more bits => e will be same
                    end
                    e_new(i,j) = e(i,j) + sign_e * b;
                elseif( e(i,j) > RM ) % Embed 1
                    e_new(i,j) = e(i,j) + sign_e * 1;
                end
                watermarked_image(i,j) = x(i,j) - e_new(i,j);
                % update locmap
                if( ( watermarked_image(i,j) == 0 ) || ( watermarked_image(i,j) == 255 ) )
                    locmap = horzcat( locmap, 1 );
                end
                
            end
            
        end
    end
end

disp(['Embedded ', num2str(len_wm), ' pure watermark bits.']);

% disp( ['Maximum Embedding Capacity : ', num2str(cnt), ' bits.'] )
% if( ncwm > cnt )
%     disp(['Embedding Capacity Exceeded by ', num2str(ncwm - cnt - 18), ' bits.'])
%     disp(['Set watermark length: ', num2str(cnt - 18), ' bits.'])
%     error('Embedding Capacity Exceeded.')
% end

% GET binary representations of LM and RM----------------------------------
temp = EightBits(LM);
LM_bin = zeros(1,9);
if( LM < 0 )
    LM_bin(1,1) = 1;
else
    LM_bin(1,1) = 0;
end
for i = 1:8
    if( temp(1,i) == '0' )
        LM_bin(1,(i+1)) = 0;
    elseif( temp(1,i) == '1' )
        LM_bin(1,(i+1)) = 1;
    end
end
temp = EightBits(RM);
RM_bin = zeros(1,8);
if( RM < 0 )
    RM_bin(1,1) = 1;
else
    RM_bin(1,1) = 0;
end
for i = 1:8
    if( temp(1,i) == '0' )
        RM_bin(1,(i+1)) = 0;
    elseif( temp(1,i) == '1' )
        RM_bin(1,(i+1)) = 1;
    end
end

% Concatenate binary reps of LM and RM and locmap
b = horzcat(LM_bin,RM_bin,locmap); 
[ nrb ncb ] = size(b);
overhead = b;
% % % Embed concatenated string into LSBs of marginal pixels-------------------
% % posb = 0;
% % for i = 1:nr
% %     for j = 1:nc
% %         if( (i == 1) || (j == 1) || (i == nr) || (j == nc) )
% %             if( (mod(i,2)==1) && (mod(j,2)==0) )
% %                 if( posb < ncb )
% %                     posb = posb + 1;
% %                     watermarked_image(i,j) = 2 * floor( watermarked_image(i,j) / 2 ) + b(1,posb);
% %                 end
% %             elseif( (mod(i,2)==0) && (mod(j,2)==1) )
% %                 if( posb < ncb )
% %                     posb = posb + 1;
% %                     watermarked_image(i,j) = 2 * floor( watermarked_image(i,j) / 2 ) + b(1,posb);
% %                 end
% %             end
% %         end
% %     end
% % end

%watermarked_image = x - e_new;
%watermarked_image = uint8( watermarked_image );
%imsave( imshow( watermarked_image ) );

end


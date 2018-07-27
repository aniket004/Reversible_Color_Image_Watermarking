function [ retrieved_image watermark ] = ExtractWatermarkInterpolation( watermarked_image, len_wm, overhead )
%[ retrieved_image watermark ] = ExtractWatermarkInterpolation( watermarked_image )
%   Detailed explanation goes here

[nr nc] = size( watermarked_image );
[ x e_new ] = Interpolate( watermarked_image );
e = e_new;
watermark = [ ];
p = double( watermarked_image );

% Get LM RM and locmap-----------------------------------------------------
% % % Get Length of Location Map
% % len_locmap = 0; % Total no. of pixels with values 0, 255
% % for i = 1:nr
% %     for j = 1:nc
% %         if( ( p(i,j) == 0 ) || ( p(i,j) == 255 ) )
% %             len_locmap = len_locmap + 1;
% %         end
% %     end
% % end
% % % Get ( 18 + len_locmap ) bits
% % k = 1; 
% % LM_RM = [ ];
% % for i = 1:nr
% %     for j = 1:nc
% %         if( (i == 1) || (j == 1) || (i == nr) || (j == nc) )
% %             if( (mod(i,2)==1) && (mod(j,2)==0) )
% %                 if( k <= ( 18 + len_locmap ) )
% %                     LM_RM = horzcat( LM_RM, LSB(p(i,j)) );
% %                     k = k + 1;
% %                 end
% %             elseif( (mod(i,2)==0) && (mod(j,2)==1) )
% %                 if( k <= ( 18 + len_locmap ) )
% %                     LM_RM = horzcat( LM_RM, LSB(p(i,j)) );
% %                     k = k + 1;
% %                 end
% %             end
% %         end
% %     end
% % end
% Compute LM, RM
LM_RM = overhead;
if( LM_RM(1,1) == 1 )
    LM = (-1)*bi2de( LM_RM(1,2:9), 'left-msb' );
elseif( LM_RM(1,1) == 0 )
    LM = bi2de( LM_RM(1,2:9), 'left-msb' );
end
if( LM_RM(1,10) == 1 )
    RM = (-1)*bi2de( LM_RM(1,11:18), 'left-msb' );
elseif( LM_RM(1,10) == 0 )
    RM = bi2de( LM_RM(1,11:18), 'left-msb' );
end
% Compute Locmap
% % locmap = LM_RM( 1, 19:( 19 + len_locmap - 1 ) );
locmap = [ ];
if( numel(overhead) > 18 )
    locmap = LM_RM( 1, 19:numel(overhead) );
end

% EXTRACT -----------------------------------------------------------------
p1 = (-1)*ones(nr,nc);
pos_locmap = 0;
for i = 1:nr
    for j = 1:nc
                
        if( e_new(i,j) == 999 )
            %e(i,j) = 999;
            e(i,j) = 0;
            p1(i,j) = p(i,j);
            if( (p(i,j)==0) || (p(i,j)==255) )
                pos_locmap = pos_locmap + 1;
            end
            
        elseif( e_new(i,j) == LM )
            if( (p(i,j)==0) || (p(i,j)==255) )
                pos_locmap = pos_locmap + 1;
                if( locmap(1,pos_locmap) == 0 )
                    p1(i,j) = p(i,j);
                elseif( locmap(1,pos_locmap) == 1 )
                    sign_e = -1;
                    b = 0;
                    watermark = horzcat(watermark,b);
                    e(i,j) = e_new(i,j) - sign_e*b;
                    p1(i,j) = x(i,j) - e(i,j);
                end
            else
                sign_e = -1;
                b = 0;
                watermark = horzcat(watermark,b);
                e(i,j) = e_new(i,j) - sign_e*b;
                p1(i,j) = x(i,j) - e(i,j);
            end
            
        elseif( e_new(i,j) == RM )
            if( (p(i,j)==0) || (p(i,j)==255) )
                pos_locmap = pos_locmap + 1;
                if( locmap(1,pos_locmap) == 0 )
                    p1(i,j) = p(i,j);
                elseif( locmap(1,pos_locmap) == 1 )
                    sign_e = 1;
                    b = 0;
                    watermark = horzcat(watermark,b);
                    e(i,j) = e_new(i,j) - sign_e*b;
                    p1(i,j) = x(i,j) - e(i,j);
                end
            else
                sign_e = 1;
                b = 0;
                watermark = horzcat(watermark,b);
                e(i,j) = e_new(i,j) - sign_e*b;
                p1(i,j) = x(i,j) - e(i,j);
            end
            
        elseif( e_new(i,j) == (LM-1) )
            if( (p(i,j)==0) || (p(i,j)==255) )
                pos_locmap = pos_locmap + 1;
                if( locmap(1,pos_locmap) == 0 )
                    p1(i,j) = p(i,j);
                elseif( locmap(1,pos_locmap) == 1 )
                    sign_e = -1;
                    b = 1;
                    watermark = horzcat(watermark,b);
                    e(i,j) = e_new(i,j) - sign_e*b;
                    p1(i,j) = x(i,j) - e(i,j);
                end
            else
                sign_e = -1;
                b = 1;
                watermark = horzcat(watermark,b);
                e(i,j) = e_new(i,j) - sign_e*b;
                p1(i,j) = x(i,j) - e(i,j);
            end
            
        elseif( e_new(i,j) == (RM+1) )
            if( (p(i,j)==0) || (p(i,j)==255) )
                pos_locmap = pos_locmap + 1;
                if( locmap(1,pos_locmap) == 0 )
                    p1(i,j) = p(i,j);
                elseif( locmap(1,pos_locmap) == 1 )
                    sign_e = 1;
                    b = 1;
                    watermark = horzcat(watermark,b);
                    e(i,j) = e_new(i,j) - sign_e*b;
                    p1(i,j) = x(i,j) - e(i,j);
                end
            else
                sign_e = 1;
                b = 1;
                watermark = horzcat(watermark,b);
                e(i,j) = e_new(i,j) - sign_e*b;
                p1(i,j) = x(i,j) - e(i,j);
            end
            
        elseif( e_new(i,j) < (LM-1) )
            if( (p(i,j)==0) || (p(i,j)==255) )
                pos_locmap = pos_locmap + 1;
                if( locmap(1,pos_locmap) == 0 )
                    p1(i,j) = p(i,j);
                elseif( locmap(1,pos_locmap) == 1 )
                    sign_e = -1;
                    e(i,j) = e_new(i,j) - sign_e*1;
                    p1(i,j) = x(i,j) - e(i,j);
                end
            else
                sign_e = -1;
                e(i,j) = e_new(i,j) - sign_e*1;
                p1(i,j) = x(i,j) - e(i,j);
            end
            
        elseif( e_new(i,j) > (RM+1) )
            if( (p(i,j)==0) || (p(i,j)==255) )
                pos_locmap = pos_locmap + 1;
                if( locmap(1,pos_locmap) == 0 )
                    p1(i,j) = p(i,j);
                elseif( locmap(1,pos_locmap) == 1 )
                    sign_e = 1;
                    e(i,j) = e_new(i,j) - sign_e*1;
                    p1(i,j) = x(i,j) - e(i,j);
                end
            else
                sign_e = 1;
                e(i,j) = e_new(i,j) - sign_e*1;
                p1(i,j) = x(i,j) - e(i,j);
            end
            
        end
                   
    end
end

temp = watermark(1,1:len_wm);
% % LSBs = watermark(1,(len_wm+1):(len_wm + 18 + len_locmap)); % LSBs of Margin elements
watermark = temp;

% % % Place LSBs of Margin elements
% % k = 1; % just 18 bits were stored
% % for i = 1:nr
% %     for j = 1:nc
% %         if( (i == 1) || (j == 1) || (i == nr) || (j == nc) )
% %             if( (mod(i,2)==1) && (mod(j,2)==0) )
% %                 if( k <= ( 18 + len_locmap ) )
% %                     p1(i,j) = 2 * floor( p(i,j) / 2 ) + LSBs(1,k);
% %                     k = k + 1;
% %                 end
% %             elseif( (mod(i,2)==0) && (mod(j,2)==1) )
% %                 if( k <= ( 18 + len_locmap ) )
% %                     p1(i,j) = 2 * floor( p(i,j) / 2 ) + LSBs(1,k);
% %                     k = k + 1;
% %                 end
% %             end
% %         end
% %     end
% % end

retrieved_image = p1;
% retrieved_image = uint8(p1);
% imsave( imshow( retrieved_image ) );

end


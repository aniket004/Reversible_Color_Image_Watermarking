function [ rgb wm ] = xRGBhist( rgb_wm, peak_r_value, peak_g_value, peak_b_value, embedded_bits )
% Watermark extraction

coeff = double( rgb_wm );
[ nr nc ns ] = size( rgb_wm );

im_ret = coeff;
wm = [ ];
b_pos = 1; 

for i = 1:nr
    for j = 1:nc
        if( b_pos <= embedded_bits )
            if( coeff(i,j,1) == peak_r_value )
                wm = horzcat( wm, 0 );
                b_pos = b_pos + 1;
            elseif( coeff(i,j,1) == ( peak_r_value + 1 ) )
                wm = horzcat( wm, 1 );
                im_ret(i,j,1) = coeff(i,j,1) - 1;
                b_pos = b_pos + 1;
            elseif( coeff(i,j,1) > ( peak_r_value + 1 ) )
                im_ret(i,j,1) = coeff(i,j,1) - 1;
            end
        end
    end
end
for i = 1:nr
    for j = 1:nc
        if( b_pos <= embedded_bits )
            if( coeff(i,j,2) == peak_g_value )
                wm = horzcat( wm, 0 );
                b_pos = b_pos + 1;
            elseif( coeff(i,j,2) == ( peak_g_value + 1 ) )
                wm = horzcat( wm, 1 );
                im_ret(i,j,2) = coeff(i,j,2) - 1;
                b_pos = b_pos + 1;
            elseif( coeff(i,j,2) > ( peak_g_value + 1 ) )
                im_ret(i,j,2) = coeff(i,j,2) - 1;
            end
        end
    end
end
for i = 1:nr
    for j = 1:nc
        if( b_pos <= embedded_bits )
            if( coeff(i,j,3) == peak_b_value )
                wm = horzcat( wm, 0 );
                b_pos = b_pos + 1;
            elseif( coeff(i,j,3) == ( peak_b_value + 1 ) )
                wm = horzcat( wm, 1 );
                im_ret(i,j,3) = coeff(i,j,3) - 1;
                b_pos = b_pos + 1;
            elseif( coeff(i,j,3) > ( peak_b_value + 1 ) )
                im_ret(i,j,3) = coeff(i,j,3) - 1;
            end
        end
    end
end

rgb = uint8(im_ret);
imsave( imshow( rgb ) );

end


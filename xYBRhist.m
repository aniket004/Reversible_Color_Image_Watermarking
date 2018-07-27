function [ ybr_rgb wm ] = xYBRhist( ybr_wm, peak_y_value, peak_cb_value, peak_cr_value, embedded_bits )
% Watermark extraction

ybr_wm = double( ybr_wm );
[ nr nc ns ] = size( ybr_wm );

% TRUNCATE----------------------------------------------------------------

sgn = sign( ybr_wm );
for i = 1:nr
    for j = 1:nc
        for k = 1:ns
            if( sgn(i,j,k) == 0 )
                sgn(i,j,k) = 1;
            end
        end
    end
end
absl = abs( ybr_wm );
coeff = floor( absl );
details = abs( ybr_wm ) - floor( absl );

% EXTRACT-----------------------------------------------------------------

im_ret = coeff;
wm = [ ];
b_pos = 1; 

for i = 1:nr
    for j = 1:nc
        if( b_pos <= embedded_bits )
            if( coeff(i,j,3) == peak_cr_value )
                wm = horzcat( wm, 0 );
                b_pos = b_pos + 1;
            elseif( coeff(i,j,3) == ( peak_cr_value + 1 ) )
                wm = horzcat( wm, 1 );
                im_ret(i,j,3) = coeff(i,j,3) - 1;
                b_pos = b_pos + 1;
            elseif( coeff(i,j,3) > ( peak_cr_value + 1 ) )
                im_ret(i,j,3) = coeff(i,j,3) - 1;
            end
        end
    end
end
for i = 1:nr
    for j = 1:nc
        if( b_pos <= embedded_bits )
            if( coeff(i,j,2) == peak_cb_value )
                wm = horzcat( wm, 0 );
                b_pos = b_pos + 1;
            elseif( coeff(i,j,2) == ( peak_cb_value + 1 ) )
                wm = horzcat( wm, 1 );
                im_ret(i,j,2) = coeff(i,j,2) - 1;
                b_pos = b_pos + 1;
            elseif( coeff(i,j,2) > ( peak_cb_value + 1 ) )
                im_ret(i,j,2) = coeff(i,j,2) - 1;
            end
        end
    end
end
for i = 1:nr
    for j = 1:nc
        if( b_pos <= embedded_bits )
            if( coeff(i,j,1) == peak_y_value )
                wm = horzcat( wm, 0 );
                b_pos = b_pos + 1;
            elseif( coeff(i,j,1) == ( peak_y_value + 1 ) )
                wm = horzcat( wm, 1 );
                im_ret(i,j,1) = coeff(i,j,1) - 1;
                b_pos = b_pos + 1;
            elseif( coeff(i,j,1) > ( peak_y_value + 1 ) )
                im_ret(i,j,1) = coeff(i,j,1) - 1;
            end
        end
    end
end

ybr = sgn.*( im_ret + details );
ybr_rgb = ybr2rgb( ybr );

figure
imsave( imshow( uint8(ybr_rgb) ) );

end


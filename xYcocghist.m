function [ ycocg_rgb wm ] = xYcocghist( ycocg_wm, peak_y_value, peak_co_value, peak_cg_value, embedded_bits )
% Watermark extraction

ybr_wm = double( ycocg_wm );
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
            if( coeff(i,j,3) == peak_cg_value )
                wm = horzcat( wm, 0 );
                b_pos = b_pos + 1;
            elseif( coeff(i,j,3) == ( peak_cg_value + 1 ) )
                wm = horzcat( wm, 1 );
                im_ret(i,j,3) = coeff(i,j,3) - 1;
                b_pos = b_pos + 1;
            elseif( coeff(i,j,3) > ( peak_cg_value + 1 ) )
                im_ret(i,j,3) = coeff(i,j,3) - 1;
            end
        end
    end
end
for i = 1:nr
    for j = 1:nc
        if( b_pos <= embedded_bits )
            if( coeff(i,j,2) == peak_co_value )
                wm = horzcat( wm, 0 );
                b_pos = b_pos + 1;
            elseif( coeff(i,j,2) == ( peak_co_value + 1 ) )
                wm = horzcat( wm, 1 );
                im_ret(i,j,2) = coeff(i,j,2) - 1;
                b_pos = b_pos + 1;
            elseif( coeff(i,j,2) > ( peak_co_value + 1 ) )
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

ycocg = sgn.*( im_ret + details );
ycocg_rgb = ycocg2rgb( ycocg );

figure
imsave( imshow( uint8(ycocg_rgb) ) );

end


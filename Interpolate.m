function [ x e ] = Interpolate( image )
%[ x e ] = Interpolation( image )
%   Returns the interpolated matrix of 'image' along with the error matrix.

if ( ischar(image) == 1 )
    %If input 'image' is the name of the image file 
    p = PrintImageMatrix(image);
else
    %If input 'image' the pixel matrix itself
    p = image;
end
p = double(p);
[nr nc] = size(p);

x = (-1) * ones(nr,nc);
% Create Margin
for i = 1:nr
    for j = 1:nc
        if( ( i == 1 ) || ( j == 1 ) || ( i == nr ) || ( j == nc ) )
            x(i,j) = p(i,j);
        end
    end
end

% Down Sample => Get the Low Resolution Pixels
for i = 1:nr
    for j = 1:nc
        if( ( mod(i,2) == 1 ) && ( mod(j,2) == 1 ) )
            x(i,j) = p(i,j);
        end
    end
end

% Error Matrix
e = 999*ones(nr,nc);

% STEP I (center high resolution pixels)
for i = 1:(nr/2 - 1)
    for j = 1:(nc/2 - 1)
        %disp('************************')
        x_45 = ( x((2*i-1),(2*j+1)) + x((2*i+1),(2*j-1)) ) / 2;
        x_135 = ( x((2*i-1),(2*j-1)) + x((2*i+1),(2*j+1)) ) / 2;
        u = ( x((2*i-1),(2*j+1)) + x((2*i+1),(2*j-1)) + x((2*i-1),(2*j-1)) + x((2*i+1),(2*j+1)) ) / 4;
        S45 = [ x((2*i-1),(2*j+1)), x_45, x((2*i+1),(2*j-1)) ];
        S135 = [ x((2*i-1),(2*j-1)), x_135, x((2*i+1),(2*j+1)) ];
        sigma_e45 = ( (S45(1) - u)*(S45(1) - u) + (S45(2) - u)*(S45(2) - u) + (S45(3) - u)*(S45(3) - u) ) / 3;
        sigma_e135 = ( (S135(1) - u)*(S135(1) - u) + (S135(2) - u)*(S135(2) - u) + (S135(3) - u)*(S135(3) - u) ) / 3;
        w45 = sigma_e135 / ( sigma_e45 + sigma_e135 );
        w135 = 1 - w45; 
        if( (sigma_e45 == 0) && (sigma_e135 == 0) )            
            x((2*i),(2*j)) = u;
        else
            x((2*i),(2*j)) = round( w45*x_45 + w135*x_135 );
        end
        e((2*i),(2*j)) = x((2*i),(2*j)) - p((2*i),(2*j));
    end
end

% STEP II (residual high resolution pixels)
for i = 2:(nr-1)
    for j = 2:(nc-1)
        if( mod((i+j),2) == 1 )
            %disp('************************')
            x_0 = ( x(i,j-1) + x(i,j+1) ) / 2;
            x_90 = ( x(i-1,j) + x(i+1,j) ) / 2;
            u = ( x(i,j-1) + x(i,j+1) + x(i-1,j) + x(i+1,j) ) / 4;
            S0 = [ x(i,j-1), x_0, x(i,j+1) ];
            S90 = [ x(i-1,j), x_90, x(i+1,j) ];
            sigma_e0 = ( (S0(1) - u)*(S0(1) - u) + (S0(2) - u)*(S0(2) - u) + (S0(3) - u)*(S0(3) - u) ) / 3;
            sigma_e90 = ( (S90(1) - u)*(S90(1) - u) + (S90(2) - u)*(S90(2) - u) + (S90(3) - u)*(S90(3) - u) ) / 3;            
            w0 = sigma_e90 / ( sigma_e0 + sigma_e90 );
            w90 = 1 - w0;
            if( (sigma_e0 == 0) && (sigma_e90 == 0) )
                x(i,j) = u;
            else
                x(i,j) = round( w0*x_0 + w90*x_90 );
            end            
            e(i,j) = x(i,j) - p(i,j);
        end
    end
end

end


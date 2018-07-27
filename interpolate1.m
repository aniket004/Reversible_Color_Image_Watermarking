function [ x e ] = Interpolate1( image )
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
        s_1 = [ x((2*i-1),(2*j-1)),x((2*i-1),(2*j+1)),x((2*i+1),(2*j-1)),x((2*i+1),(2*j+1))];
        s_1_median = median(s_1);
       
            x((2*i),(2*j)) = round(s_1_median);  %level 1 values
        
        e((2*i),(2*j)) = x((2*i),(2*j)) - p((2*i),(2*j));
    end
end

% STEP II (residual high resolution pixels)
for i = 2:(nr-1)
    for j = 2:(nc-1)
        if( mod((i+j),2) == 1 )
            %disp('************************')
            if( mod(i,2) == 0 )
                s_2 = [ x(i,j-1),x(i-1,j),x(i-1,j),x(i,j+1),x(i+1,j),x(i+1,j) ];
                s_2_median = median(s_2);
                
                x(i,j) = round(s_2_median);      %level 2 values
                e(i,j) = x(i,j) - p(i,j);
            else
                s_3 = [ x(i,j-1),x(i,j-1),x(i-1,j),x(i,j+1),x(i,j+1),x(i+1,j)];
                s_3_median = median(s_3);
                
                x(i,j) = round(s_3_median);       %level 3 values
                e(i,j) = x(i,j) - p(i,j);
            end
        end 
    end
end

end


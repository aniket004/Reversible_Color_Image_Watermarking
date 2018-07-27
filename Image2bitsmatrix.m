function [ bitsmatrix ] = Image2bitsmatrix( image )
%[ bitsmatrix ] = Image2bitsmatrix( image )
%   Converts an image pixel matrix to a bitstream.

if ( ischar(image) == 1 )
    %If input 'image' is the name of the image file 
    p = PrintImageMatrix(image);
else
    %If input 'image' the pixel matrix itself
    p = image;
end
[ nr nc ] = size(p);
p = double(p);

bitsmatrix = [ ];

for i = 1:nr
    for j = 1:nc
        %Get eight bits representation of the pixels
        temp = EightBits( p(i,j) );
        %Convert the bitstream temp to matrix temp_mat
        temp_mat = zeros(1,8);
        for k = 1:8
            if( temp(1,k) == '0' )
                temp_mat(1,k) = 0;
            elseif( temp(1,k) == '1' )
                temp_mat(1,k) = 1;
            end
        end
        bitsmatrix = horzcat( bitsmatrix, temp_mat );
    end
end
        


end
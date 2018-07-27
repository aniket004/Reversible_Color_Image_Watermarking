function  [pixel_matrix] = PrintImageMatrix( image_name )
%[pixel_matrix, pixel_matrix_size] = PrintImageMatrix( image_name ) 
%prints pixels of image file 'image_name' in matrix form along with size of
%the matrix.
%Note: Values of pixels are converted to 8-bit unsigned integer values 
%using UINT8 if they are not so initially.
%
%Input:  image_name: image file name
%Output: pixel_matrix: Matrix storing the values of pixels

pixel_matrix = imread( image_name );
%pixel_matrix_size: Integer storing the size of pixel_matrix
pixel_matrix_size = size( pixel_matrix );

%Convert all elements of pixel_matrix to unsigned 8-bit integers
for i = 1:pixel_matrix_size(1,1)
    for j = 1:pixel_matrix_size(1,2)
        temp = uint8( pixel_matrix(i,j) );
        pixel_matrix(i,j) = temp;
    end
end

disp( [ num2str( pixel_matrix_size(1,1) ), ' rows.'] );
disp( [ num2str( pixel_matrix_size(1,2) ), ' columns.'] );

end


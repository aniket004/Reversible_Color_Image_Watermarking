function[YCuCv] = rgb2YCuCv(rgb_image)

    R = rgb_image(:,:,1);
    G = rgb_image(:,:,2); 
    B = rgb_image(:,:,3);
    
    Y = floor( (double(R) + 2* double(G) + double(B))/4 );
    Cu = double(R) - double(G);
    Cv = double(B) - double(G);
    
    rgb_image = double( rgb_image );
    [ nr nc ns ] = size( rgb_image );

    YCuCv = zeros(nr,nc,3);

    
    YCuCv(:,:,1) = Y;      
    YCuCv(:,:,2) = Cu;
    YCuCv(:,:,3) = Cv;


end
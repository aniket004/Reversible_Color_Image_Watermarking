function [ t1_image ] = rgb2t1( rgb_image )
    
    R = double(rgb_image(:,:,1));
    G = double(rgb_image(:,:,2)); 
    B = double(rgb_image(:,:,3));
    
    double(V) = R - G;
    double(U') = B - G;
    double(Y) = G + floor((V+U')/4);
    double(U) = U' - floor(V/2);
    

    rgb_image = double( rgb_image );
    [ nr nc ns ] = size( rgb_image );

    t1_image = zeros(nr,nc,3);

    
    t1_image(:,:,1) = Y;      
    t1_image(:,:,2) = U;
    t1_image(:,:,3) = V;



end
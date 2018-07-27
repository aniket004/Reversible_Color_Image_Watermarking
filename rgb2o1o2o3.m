function[o1o2o3] = rgb2o1o2o3(rgb_image)

    R = rgb_image(:,:,1);
    G = rgb_image(:,:,2); 
    B = rgb_image(:,:,3);
    
    o1 = floor( (double(R)+double(G)+double(B))/3 + 0.5 );
    o2 = floor( ( double(R)-double(B))/2 + 0.5 );
    o3 = B - 2*G + R ;
    
    rgb_image = double( rgb_image );
    [ nr nc ns ] = size( rgb_image );

    o1o2o3 = zeros(nr,nc,3);

    
    o1o2o3(:,:,1) = o1;      
    o1o2o3(:,:,2) = o2;
    o1o2o3(:,:,3) = o3;


end
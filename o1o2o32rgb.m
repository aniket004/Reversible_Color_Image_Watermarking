function[rgb_image] = o1o2o32rgb(o1o2o3)

    
   
    o1 = o1o2o3(:,:,1);
    o2 = o1o2o3(:,:,2); 
    o3 = o1o2o3(:,:,3);
    
    B = double(o1) - double(o2) + floor( double(o3)/2 + 0.5 ) - floor( double(o3)/3 + 0.5 );
    G = double(o1) - floor( double(o3)/3 +0.5 );
    R = double(o1) + double(o2) + double(o3) - floor( double(o3)/2 + 0.5 ) - floor( double(o3)/3 + 0.5 );
    
    o1o2o3 = double( o1o2o3 );
    [ nr nc ns ] = size( o1o2o3 );

    rgb_image = zeros(nr,nc,3);

    
    rgb_image(:,:,1) = R;      
    rgb_image(:,:,2) = G;
    rgb_image(:,:,3) = B;


end
function [ rgb_image ] = t12rgb( t1_image )
    
    Y = double(t1_image(:,:,1));
    U = double(t1_image(:,:,2)); 
    V = double(t1_image(:,:,3));
    
    double(U') = U + floor(V/2);
    double(G) = Y - floor((V+U')/4) ;
    double(B) = U' + G;
    double(R) = V + G;
    

    t1_image = double( t1_image );
    [ nr nc ns ] = size( t1_image );

    rgb_image = zeros(nr,nc,3);

    
    rgb_image(:,:,1) = R;      
    rgb_image(:,:,2) = G;
    rgb_image(:,:,3) = B;



end
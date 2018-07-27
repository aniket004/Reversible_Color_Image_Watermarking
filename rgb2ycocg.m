function[ycocg] = rgb2ycocg(rgb_image)

    R = rgb_image(:,:,1);
    G = rgb_image(:,:,2); 
    B = rgb_image(:,:,3);
    
    Co = double(R) - double(B);
    t = double(B) + floor(Co/2);
    Cg = double(G) - double(t);
    Y = double(t) + floor(Cg/2);
    
    rgb_image = double( rgb_image );
    [ nr nc ns ] = size( rgb_image );

    ycocg = zeros(nr,nc,3);

    
    ycocg(:,:,1) = Y;      
    ycocg(:,:,2) = Co;
    ycocg(:,:,3) = Cg;


end
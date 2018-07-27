function [ rgb_image ] = ycocg2rgb(ycocg)

    Y = ycocg(:,:,1);
    Co = ycocg(:,:,2);
    Cg = ycocg(:,:,3);
    
    t = double(Y) - floor(Cg/2);
    G = double(Cg) + double(t);
    B = double(t) - floor(Co/2);
    R = double(B) + double(Co);
    
    rgb_image(:,:,1) = R;
    rgb_image(:,:,2) = G;
    rgb_image(:,:,3) = B;

end
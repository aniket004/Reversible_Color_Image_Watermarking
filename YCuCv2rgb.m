function [ rgb_image ] = YCuCv2rgb(YCuCv)

    Y = YCuCv(:,:,1);
    Cu = YCuCv(:,:,2);
    Cv = YCuCv(:,:,3);
    
    G = double(Y) - floor( (double(Cu) + double(Cv))/4 );
    R = double(Cu) + double(G);
    B = double(Cv) + double(G);
    
    rgb_image(:,:,1) = R;
    rgb_image(:,:,2) = G;
    rgb_image(:,:,3) = B;

end
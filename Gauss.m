function [ result ] = Gauss( image_original, image_modified )
%Gaussian human visual system model
%Gives a HVS based error estimator metric
%Gives the error between two images image_original, image_modified.

p1 = double( imread( image_original ) )/255;
p2 = double( imread( image_modified ) )/255;

[ m n p ] = size(p1);

t1 = power(p1,2) + power(p2,2);
t2 = 2*exp( -t1/1.5 ) + exp( -t1/8 );
t3 = sum( sum( sum( t2 ) ) );
result = t3/(m*n*p);

end


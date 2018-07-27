function [ nmse ] = MSE( matrix1, matrix2 )
%[ nmse ] = MSE( matrix1, matrix2 )
%   'nmse' gives the Mean Square Error of matrices 1 and 2

matrix1 = double( matrix1 );
matrix2 = double( matrix2 );

%Check dimensions of 2 matrices
if ( size(matrix1) == size(matrix2) )
    
    [nr nc ns] = size(matrix1); %Get dimensions of the matrices
    nmse = 0;
    for i = 1:nr
        for j = 1:nc
            for k = 1:ns
                if ( matrix1(i,j,k) == matrix2(i,j,k) )
                    ; 
                else
                    temp = matrix1(i,j,k) - matrix2(i,j,k);
                    nmse = nmse + temp^2;
                end
            end
        end
    end
    
    nmse = nmse / (nr*nc*ns);
    
else
    error('Dimension mismatch in MSE calculation.'); %Error if dimensions mismatch
end


end


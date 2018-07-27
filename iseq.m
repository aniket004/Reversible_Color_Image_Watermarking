function [ ] = iseq( m1, m2 )
%Checks if matrices m1 and m2 are equal element by element.
%

if ( size(m1) == size(m2) )
    [ nr nc nl ] = size( m1 );
    flag = 0;
    for i = 1:nr
        for j = 1:nc
            for k = 1:nl
                if ( m1(i,j,k) == m2(i,j,k) )
                    ;
                else
                    flag = 1;
                end
            end
        end
    end
    if( flag == 0 )
        disp('The matrices are equal element by element.')
    elseif( flag == 1 )
        disp('The matrices are not equal.')
    end
else
    disp('Dimensions unequal.')
end


end


function  [bitstring] = EightBits( I )
%[bitstring] = EightBits(I) converts integer I into its 8-bit binary
%encoding, bitstring.
%Example, EightBits(2) returns bitstring = 00000010
%Input:   I: an integer
%Output:  bitstring: a 1X8 array of 0s and 1s

%Convert I into an unsigned 8 bit integer
I8 = uint8( I );

%binary encoding of I consisting of 8 or lesser number of bits
bin = dec2bin(I8);

%no. of columns in bin = no. of bits in binary encoding of I 
[nr, nc] = size( bin ); %nr = number of rows
                        %nc = number of columns
%disp(nc)

%If number of bits < 8, shift each bit right so that the rightmost bit occupies 
%the 8th position.
if( nc < 8 )
    
    %Shift each bit of bin right by (8 - nc) positions
    for i = 1:nc
        bitstring( 1, (8 - nc + i) ) = bin(i); 
    end
    
    %Fill in the remaining (8 - nc) left bits by zeros.
    for j = 1:(8 - nc)
        bitstring( 1, j ) = '0'; 
    end
    
%If bin has 8 bits, then the original binary encoding of I is returned
else
    bitstring(1,:) =  bin;
end

end


function [ lsb ] = LSB( input_int )
%[ lsb ] = LSB( input_int )
%   Returns the 'lsb' of the input_int.

lsb_temp = de2bi( abs(input_int), 'left-msb' ); %Convert to binary
[x len] = size(lsb_temp); %Find out no. of bits (len)
lsb = lsb_temp(1,len); %Take LSB

end


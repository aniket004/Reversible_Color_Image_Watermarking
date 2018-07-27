

%------------------------------RGB------------------------------------------

img = imread('lena.tiff'); % Read image
red = img(:,:,1); % Red channel
green = img(:,:,2); % Green channel
blue = img(:,:,3); % Blue channel
a = zeros(size(img, 1), size(img, 2));
just_red = cat(3, red, a, a);
just_green = cat(3, a, green, a);
just_blue = cat(3, a, a, blue);
back_to_original_img = cat(3, red, green, blue);
figure, imshow(img), title('Original image')
figure, imshow(just_red), title('Red channel')
figure, imshow(just_green), title('Green channel')
figure, imshow(just_blue), title('Blue channel')
figure, imshow(back_to_original_img), title('Back to original image')

%-----------------------------YCoCg----------------------------------------

ycocg_img = rgb2ycocg(img);
y = ycocg_img(:,:,1);
Co = ycocg_img(:,:,2);
Cg = ycocg_img(:,:,3);
a = zeros(size(ycocg_img,1), size(ycocg_img,2));
just_Y = cat(3, y, a, a);
just_Co = cat(3, a, Co, a);
just_Cg = cat(3, a, a, Cg);
%back_to_original_img = cat(3, red, green, blue);
figure, imshow(img), title('Original image')
figure, imshow(just_Y/100), title('Y channel')
figure, imshow(just_Co/100), title('Co channel')
figure, imshow(just_Cg/0.01), title('Cg channel')
%figure, imshow(back_to_original_img), title('Back to original image')




%dr=uigetdir();
dr = 'E:\research_MS_code\Coverage\COVERAGE_Modified\image';
x = 1;
img = imread([dr, '\', num2str(x), '.tif']);        %here jpg is file extension of the images
img_t = imread([dr, '\', num2str(x), 'tt.tif']);

[x e] = interpolate1(rgb2gray(img));
[x_t e1] = interpolate1(rgb2gray(img_t));

figure(1), hist(double(e(:)),256);
figure(2), hist(double(e1(:)),256);

sum(sum(e))

sum(sum(e1))
 
% imshow(img)
% figure,imshow(img_t)
% figure,imshow(e-e1)
% %figure,imshow(e1-e)
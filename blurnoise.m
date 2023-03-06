fileName = 'lena_gray_256'; %file name of image. WITHOUT EXTENTION
fileExt = '.tif'; %file type of input also used for output.
sourceFolder = 'source_images\'; %include "\" at end

outputFolder = 'blurrednoised_images\'; %include "\" at end


%reading file and converting value type to double.
file=strcat(sourceFolder, fileName, fileExt);
img = im2double(imread(file)); 

%Adds linear blur in horizontal direction. blur length 10.
%and AWGN (image, type, mean, variance)
bFunct = fspecial('motion',10,0);  
b = imfilter(img, bFunct, 'conv');
f = imnoise(b, "gaussian",0,0.01);  

%Implementation for Image Restoration

figure(1), imshow(img), title("Original Image");
imshow(b), title("blur"); 
figure(2), imshow(f), title("Blur & Noise"); 

imwrite(b,strcat(outputFolder,fileName,'_onlyBLUR',fileExt));
imwrite(f,strcat(outputFolder,fileName,'_BLUR_AWGN',fileExt));

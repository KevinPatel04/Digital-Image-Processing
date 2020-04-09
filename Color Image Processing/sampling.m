function [] = sampling()
  close all;clear;clc;
  
  % replace `PATH_TO_IMAGE_FILE` with actual image file path
  impath = 'PATH_TO_IMAGE_FILE';

  % read image
  img = imread(impath);

  % get the dimensions of image
  [nr, nc] = size(img);
  
  subplot(1,3,1),imshow(img);
  title('Original image');

  imggray = rgb2gray(img);
  subplot(1,3,2),imshow(imggray);
  title('GrayScale Image');
  
  % set the number of skips
  m = 2;    % reads pixel 1st and then skips 2nd pixel and reads 3rd pixel and so on...
  
  l=1;
  for i = 1:m:nr
    k=1;
      for j = 1:m:nc
        imggray_new(l,k) = imggray(i,j);
        k=k+1;
      endfor
      l=l+1;
  endfor
  subplot(1,3,3),imshow(imggray_new);
  title("GrayScale Image After Sampling");
  
endfunction

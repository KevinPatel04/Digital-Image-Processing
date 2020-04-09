function [imred,imblue,imgreen] = slice_color_channel()

  % replace `PATH_TO_RGB_COLORED_IMAGE` with actual image file path
  impath = 'PATH_TO_RGB_COLORED_IMAGE';
  
  % read image
  img = imread(impath);
  
  % fetch the width and height dimension of image
  [nr,nc] = size(img(:,:,1));
  
  % red color component of img
  imred=uint8(zeros(nr,nc,3));
  imred(:,:,1)=img(:,:,1);
  
  % green color component of img
  imgreen=uint8(zeros(nr,nc,3));
  imgreen(:,:,2)=img(:,:,2);
  
  % blue color component of img
  imblue=uint8(zeros(nr,nc,3));
  imblue(:,:,3)=img(:,:,3);
  
  % plot the results
  subplot(1,4,1),imshow(img);
  title('Original image','FontSize',18);
  
  subplot(1,4,2),imshow(imred);
  title('Red image','FontSize',18);
  
  subplot(1,4,3),imshow(imgreen);
  title('Green image','FontSize',18);
  
  subplot(1,4,4),imshow(imblue);
  title('Blue image','FontSize',18);
  
endfunction
function grayscale = RBG2GRAY()
  
  % replace `PATH_TO_RGB_COLOR_IMAGE` with actual image file
  impath = 'PATH_TO_RGB_COLOR_IMAGE';
  
  % read image
  img = imread(impath);
  
  % convert rgb image to gray image
  grayscale=rgb2gray(img);
  
  % plot the results
  subplot(1,2,1),imshow(img);
  title('Original RGB image','FontSize',18);
  
  subplot(1,2,2),imshow(grayscale);
  title('GrayScale image','FontSize',18);
  
endfunction

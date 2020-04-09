function img = RGB_PLOT()

  % replace `PATH_TO_RGB_COLOR_IMAGE` with actual image file
  %impath = 'PATH_TO_RGB_COLOR_IMAGE';
  impath = '../images/input images/kevin.jpg';
  
  % read image
  img = imread(impath);
  
  % convert rgb image to hsv image
  imhsv=colormap(img);
  
  % plot the results
  subplot(1,2,1),imshow(img);
  title('Original RGB image','FontSize',18);
  
  subplot(1,2,2),imshow(imhsv);
  title('HSV image','FontSize',18);

endfunction
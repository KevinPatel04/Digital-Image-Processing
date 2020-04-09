function imind = GRAY2IND()
  
  % replace `PATH_TO_GRAY_IMAGE` with actual image file
  impath = 'PATH_TO_GRAY_IMAGE';
  
  % read image
  img = imread(impath);
  
  % convert grayscale image to indexed image
  imind=gray2ind(img);
  
  % plot the results
  subplot(1,2,1),imshow(img);
  title('Original RGB image','FontSize',18);
  
  subplot(1,2,2),imshow(imind);
  title('Indexed image','FontSize',18);
  
endfunction
function imlogtrans = log_transformation(impath,c)
  
  % replace `PATH_TO_IMAGE` with actual image file path
  impath = 'PATH_TO_IMAGE_FILE';

  % read image
  img = imread(impath);

  % c is a constant
  c = 1

  subplot(1,2,1),imshow(img);
  title('Original Image');
  
  % convert uint8 to double
  img = double(img);
  
  % perform log transoformation using s = c * log( 1 + c )
  imlogtrans = c .* log(1 + img);
  
  subplot(1,2,2),imshow(imlogtrans);
  title('Log Transformation Image');
  
endfunction

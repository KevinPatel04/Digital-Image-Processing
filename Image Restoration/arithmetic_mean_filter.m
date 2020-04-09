function resimg = arithmetic_mean_filter()

  % replace `PATH_TO_IMAGE` with actual image file
  impath = 'PATH_TO_IMAGE';
  
  % read image
  img = imread(impath);
  
  % convert rgb image to gray scale only if input image is colormap
  % img = rgb2gray(img);
  
  % create 5 x 5 mask
  mask = ones(5,5) / 25;
  
  % apply filter on image
  resimg = imfilter(img,mask);
  
  % display results
  subplot(1,2,1),imshow(img);
  title('Original Image','FontSize',18);
  
  subplot(1,2,2),imshow(resimg);
  title('After applying Arithmetic Mean Filter','FontSize',18);

endfunction
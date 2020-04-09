function resimg = remove_uniform_noise()

  % replace `PATH_TO_IMAGE` with actual image file
  impath = 'PATH_TO_IMAGE';
  
  % read image
  img = imread(impath);
  
  % convert rgb image to gray scale only if input image is colormap
  % img = rgb2gray(img);
  
  subplot(1,3,1),imshow(img);
  title('Image with Uniform Noise','FontSize',18);
  
  % plot histogram for the input image
  subplot(1,3,2),imhist(img);
  title('Histogram','FontSize',18);
  
  % remove uniform noise using arithmetic mean filter
  % create 5 x 5 mask
  mask = ones(5,5) / 25;
  
  % apply filter on image
  resimg = imfilter(img,mask);
  
  % plot the results
  subplot(1,3,3),imshow(resimg);
  title('After removing Uniform Noise','FontSize',18);
  
endfunction
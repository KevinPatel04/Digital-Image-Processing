function resimg = remove_gusssian_noise()
  
  % replace `PATH_TO_IMAGE` with actual image file
  impath = 'PATH_TO_IMAGE';
  
  % read image
  img = imread(impath);
  
  % convert rgb image to gray scale only if input image is colormap
  % img = rgb2gray(img);
  
  subplot(1,3,1),imshow(img);
  title('Image with Gaussian Noise','FontSize',18);
  
  % plot histogram for the input image
  subplot(1,3,2),imhist(img);
  title('Histogram','FontSize',18);
  
  % remove guassian noise using guassian filter
  h=fspecial('gaussian',13,.9);
  resimg=imfilter(img,h,'conv');
  
  % plot the results
  subplot(1,3,3),imshow(resimg);
  title('After removing Gaussian Noise','FontSize',18);
  
endfunction
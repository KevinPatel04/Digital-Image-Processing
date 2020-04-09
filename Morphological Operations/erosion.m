function resimg = erosion(impath)
  
  % read image
  img = imread(impath);
  
  % convert to grayscale only if original image is RGB or Colormap
  # img = rgb2gray(img);
  
  % create structuring element
  % visit https://in.mathworks.com/help/images/ref/strel.html for more information on structig element
  se = strel('square',10); % create square structuring element of 10px x 10px side length
  
  % matlab function imerode
  resimg = imerode(img,se);
  
  % plot results
  subplot(1,2,1),imshow(img);
  title('Original Gray Image','FontSize',18);
  
  subplot(1,2,2),imshow(resimg);
  title('Image After Erosion','FontSize',18);
  
endfunction

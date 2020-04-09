function resimg = boundary_extraction(impath)
  
  % read image
  img = imread(impath);
  
  % convert to grayscale
  % img = rgb2gray(img);
  
  % create structuring element
  % visit https://in.mathworks.com/help/images/ref/strel.html for more information on structig element
  se = strel('square',10); % create square structuring element of 10px x 10px side length
  
  % matlab function imerode
  temp = imerode(img,se);
  
  % subtract original image from the eroded image
  resimg = imsubtract(img,temp);
  
  % plot results
  subplot(1,2,1),imshow(img);
  title('Original Gray Image','FontSize',18);
  
  subplot(1,2,2),imshow(uint8(resimg));
  title('Image After Boundary Extraction','FontSize',18);
  
endfunction

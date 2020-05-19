function [] = logical_arithmetic_operations()
  
  % replace `PATH_TO_IMAGE_FILE` with actual image file path
  impath = 'PATH_TO_IMAGE_FILE';

  % read image
  img = imread(impath);
  
  % convert rgb image to grayscale
  imgray = rgb2gray(img);

  % get the dimensions of image
  [nr,nc] = size(imgray);
  
  % generate black mask image of the same size of imgray
  imgmask = uint8(zeros(nr,nc));
  
  % add two white rectangles in place of eyes
  % you need to adjust the maskeye size according to your need and imgmask size
  maskeye = 255 .* ones(201,251);
  
  % place the maskeye in correct cordinate where your eyes are located
  % create left eye mask
  imgmask(700:900,750:1000)= maskeye;
  
  % create right eye mask
  imgmask(700:900,350:600)= maskeye;

  %%
  % Logical and Arithmetic Operations  
  %
  % bitwise and
  imand = bitand(imgray,imgmask);
  % bitwise or
  imor = bitor(imgray,imgmask);
  % bitwise sum
  imsum = uint8(imadd(imgray,imgmask));
  % bitwise sub
  imsub = uint8(imsubtract(imgray,imgmask));
  %%
  
  % display results
  subplot(2,3,1),imshow(imgray);
  title('My Gray Image','FontSize',18);
  subplot(2,3,4),imshow(imgmask);
  title('My Mask Image','FontSize',18);
  subplot(2,3,2),imshow(imand);
  title('AND Image','FontSize',18);
  subplot(2,3,5),imshow(imor);
  title('OR Image','FontSize',18);
  subplot(2,3,3),imshow(imsum);
  title('SUM Image','FontSize',18);
  subplot(2,3,6),imshow(imsub);
  title('SUB Image','FontSize',18);
  
endfunction
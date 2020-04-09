function resimg = noise_detection_using_histogram()
  
  %%
  %
  % GAUSSIAN NOISE
  %
  % path for image file which has gaussian noise
  impath = 'images/input images/e20.tif'; 
  
  % read image
  img = imread(impath);
  
  subplot(2,6,3),imshow(img);
  title('Gaussian Noise','FontSize',18);
  
  % plot histogram for the input image
  subplot(2,6,9),imhist(img);
  
  %%
  %
  % RAYLEIGH NOISE
  %
  % path for image file which has rayleigh noise
  impath = 'images/input images/e21.tif'; 
  
  % read image
  img = imread(impath);
  
  subplot(2,6,4),imshow(img);
  title('Rayleigh Noise','FontSize',18);
  
  % plot histogram for the input image
  subplot(2,6,10),imhist(img);
  
  %%
  %
  % GAMMA NOISE
  %
  % path for image file which has gamma noise
  impath = 'images/e22.tif'; 
  
  % read image
  img = imread(impath);
  
  subplot(2,6,2),imshow(img);
  title('Gamma Noise','FontSize',18);
  
  % plot histogram for the input image
  subplot(2,6,8),imhist(img);
  
  %%
  %
  % EXPONENTIAL NOISE
  %
  % path for image file which has exponential noise
  impath = 'images/input images/e23.tif'; 
  
  % read image
  img = imread(impath);
  
  subplot(2,6,6),imshow(img);
  title('Exponential Noise','FontSize',18);
  
  % plot histogram for the input image
  subplot(2,6,12),imhist(img);
  
  %%
  %
  % UNIFORM NOISE
  %
  % path for image file which has uniform noise
  impath = 'images/input images/e24.tif'; 
  
  % read image
  img = imread(impath);
  
  subplot(2,6,1),imshow(img);
  title('Uniform Noise','FontSize',18);
  
  % plot histogram for the input image
  subplot(2,6,7),imhist(img);
  
  %%
  %
  % IMPULSE NOISE
  %
  % path for image file which has impluse noise
  impath = 'images/input images/e25.tif'; 
  
  % read image
  img = imread(impath);
  
  subplot(2,6,5),imshow(img);
  title('Impulse Noise','FontSize',18);
  
  % plot histogram for the input image
  subplot(2,6,11),imhist(img);
  
endfunction
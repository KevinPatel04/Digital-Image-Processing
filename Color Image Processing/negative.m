function imneg = negative()
  % replace `PATH_TO_IMAGE` with actual image file path
  impath = 'PATH_TO_IMAGE_FILE';

  % read image
  img = imread(impath);
  
  % number of spectrum of colors supported in image
  % 256 : for uint8 image (8 bit image)
  L = 256; 
  
  % convert img image to imneg
  imneg = (L - 1) - img;
  
  % show original image
  imshow(img);
  Title('Original Image');
  
  % show negative image
  imshow(imneg);
  title('Negative');
endfunction

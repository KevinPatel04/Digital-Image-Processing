function [ nr, nc ] = getDimensions()
  % replace `PATH_TO_IMAGE_FILE` with actual image file path
  impath = 'PATH_TO_IMAGE_FILE';

  % read image
  img = imread(impath);

  % get the dimensions of image
  % if img is colour image then dimension is vector with 3 elements
  % if img is grayscale image then dimension is vector wit 2 dimensions
  dimensions = size(img);

  % number of rows
  nr = dimensions(1);

  % number of columns
  nc = dimensions(2);

  % show image
  imshow(img);

  % give title to the image
  title(strcat({'This is image with '},num2str(nr),{' X '},num2str(nc)));
endfunction

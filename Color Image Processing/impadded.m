%%
% This function accepts 5 parameters:
%
% impath => [string] Image File Path
% addr => [int] Number of rows to be added on both the sides
% addc => [int] Number of columns to be added on both the sides
% showplots => [boolean] TRUE if you want to show plot else FALSE 
% isNotGray => [boolean] TRUE if image is colormap or rgb image else FALSE
%

function padded_img = impadded(impath,addr,addc,showplots,isNotGray)
  
  % read image
  img = imread(impath);
  
  % check if image isNotGray == TRUE then convert to grayscale
  if isNotGray
    img = rgb2gray(img);
  end if
  
  % fetch the dimensions of the image
  [nr,nc]=size(img);
  
  % initialize the padded_img with all zeros
  padded_img = uint8(zeros(nr+2*addr,nc+2*addc));
  
  % copy img to center of the padded_img
  padded_img((addr+1):(nr+addr),(addc+1):(nc+addc)) = img;
  
  % check if subplots == TRUE then plot the results
  if showplots
    subplot(1,2,1),imshow(img);
    title('Input Gray Image');
    subplot(1,2,2),imshow(padded_img);
    title('Output Gray Padded Image');
  endif
  
endfunction

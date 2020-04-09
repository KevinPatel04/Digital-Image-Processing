function resimg = harmonic_mean_filter()
  
  % replace `PATH_TO_IMAGE` with actual image file
  impath = 'PATH_TO_IMAGE';
  impath = 'exp img/e24.tif';
  
  % read image
  img = imread(impath);
  
  % convert rgb image to gray scale only if input image is colormap
  % img = rgb2gray(img);
  
  % convert image from uint8 to double
  imdouble = double(img);
  
  % get image dimensions
  [nr,nc] = size(img);
  
  resimg(1,:) = imdouble(1,:);
  resimg(1:nr,1) = imdouble(1:nr,1);
  resimg(nr,:) = imdouble(nr,:);
  resimg(1:nr,nc) = imdouble(1:nr,nc);
  
  % apply filter on image
  for i = 2:(nr-1)
    for j = 2:(nc-1)
      
       resimg(i,j) = 9/((1/(imdouble(i-1,j-1)+1))+(1/(imdouble(i-1,j)+1))+(1/(imdouble(i-1,j+1)+1))+(1/(imdouble(i,j-1)+1))+(1/(imdouble(i,j)+1))+(1/(imdouble(i,j+1)+1))+(1/(imdouble(i+1,j-1)+1))+(1/(imdouble(i+1,j)+1))+(1/(imdouble(i+1,j+1)+1)));
       
    endfor
  endfor
  
  
  % convert result image from double to uint8
  resimg = uint8(resimg);
  
  % display results
  subplot(1,2,1),imshow(img);
  title('Original Image','FontSize',18);
  
  subplot(1,2,2),imshow(resimg);
  title('After applying Harmonic Mean Filter','FontSize',18);
  
endfunction
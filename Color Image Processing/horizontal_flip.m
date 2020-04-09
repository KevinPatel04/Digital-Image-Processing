function resimg = horizontal_flip()
  
  % replace `PATH_TO_IMAGE` with actual image file
  impath = 'PATH_TO_IMAGE';
  
  img = imread(impath);
  
  % fetch the dimension of image
  % n denotes number of color channel / planes (i.e. 3 for RGB image)
  % nr & nc defines number of rows & columns respectively in each planes
  [nr,nc,n] = size(img);
  
  % logic for flipping the image
  for i = 1:nr
        
    resimg(i,1:nc,1:n) = img(nr-i+1,1:nc,1:n);
          
  endfor

  % plot the results
  subplot(1,2,1),imshow(img);
  title('Original Image','FontSize',18);
  
  subplot(1,2,2),imshow(resimg);
  title('Horizontally Filpped Image','FontSize',18);
  
endfunction
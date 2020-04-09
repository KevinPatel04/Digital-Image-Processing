function resimg = closing(impath)
  
  %%
  % Can also try MATLAB in-built function imclose() instead of following
 
  % read image
  img = imread(impath);
  
  % convert to grayscale
  % img = rgb2gray(img);
  
  % create circle structuring element
  % visit https://in.mathworks.com/help/images/ref/strel.html for more information on structig element
  se = strel('disk',10,0);
  
  % matlab function imdilate
  resimg1 = imdilate(img,se);
  
  % matlab function imerode
  resimg2 = imerode(resimg1,se);
  
  % plot results
  subplot(1,2,1),imshow(img);
  title('Original Gray Image','FontSize',18);
  
  subplot(1,2,2),imshow(resimg2);
  title('Image After Closing','FontSize',18);
  
endfunction

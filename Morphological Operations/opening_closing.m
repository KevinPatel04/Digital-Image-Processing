function resimg = opening_closing(impath)
  
  % read image
  img = imread(impath);
  
  % convert to grayscale
  % img = rgb2gray(img);
  
  % create circle structuring element
  % visit https://in.mathworks.com/help/images/ref/strel.html for more information on structig element
  se = strel('disk',1,0);
  
  % matlab function imerode
  resimg1 = imerode(img,se);
  
  % matlab function imdilate
  resimg2 = imdilate(resimg1,se);
  
  % matlab function imdilate
  resimg3 = imdilate(resimg2,se);
  
  % matlab function imerode
  resimg = imerode(resimg3,se);
  
  % plot results
  subplot(1,5,1),imshow(img);
  title('Original Gray Image','FontSize',18);
  
  subplot(1,5,2),imshow(resimg1);
  title('Erosion on Previous Image','FontSize',18);
   
  subplot(1,5,3),imshow(resimg2);
  title('Dilation on Previous Image','FontSize',18);
  
  subplot(1,5,4),imshow(resimg3);
  title('Dilation on Previous Image','FontSize',18);
  
  subplot(1,5,5),imshow(resimg);
  title('Erosion on Previous Image','FontSize',18);
  
endfunction
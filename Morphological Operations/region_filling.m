function resimg = region_filling()
  
  % replace `PATH_TO_IMAGE` with actual image file
  impath = 'PATH_TO_IMAGE';
  
  % read image
  img = imread(impath);
  
  % convert image to BW / Binary image
  imgbw = im2bw(img);
  
  % fill the holes present in the image
  resimg = imfill(imgbw,'holes');
  
  % plot the reults
  subplot(1,2,1),imshow(imgbw);
  title('BW Image','FontSize',18);
  subplot(1,2,2),imshow(resimg);
  title('Image after region filling','FontSize',18);
  
endfunction
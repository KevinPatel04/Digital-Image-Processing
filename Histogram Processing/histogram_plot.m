function [count,grayscale] = histogram_plot()
  
  %%
  % you can also use inbuilt function `imhist()` in matlab to plot histogram for any image
  %
  
  % replace `PATH_TO_IMAGE` with actual image file path
  impath = 'PATH_TO_IMAGE_FILE';
  
  % define grayscale (all the possible intensity value in the image)
  grayscale = 0:255;

  % read image
  img = imread(impath);
  
  imggray=rgb2gray(img);  % optional only if image is color image
  
  % fetch image dimensions
  [nr,nc]=size(imggray);
  
  count=zeros(1,256);
  for i = 1:nr
      for j = 1:nc
        count(imggray(i,j))=count(imggray(i,j))+1;
      endfor
  endfor
  
  % Show Image
  subplot(1,2,1),imshow(imggray);
  title('Image','FontSize',20);
  
  % plot the bar chart
  subplot(1,2,2),bar(grayscale, count, 'BarWidth', 1);
  
  % define xlabel
  xlabel('Gray Level','FontSize',20);
  
  % define ylabel
  ylabel('Pixel Count','FontSize',20);
  
  % title of the plot
  title('Histogram Plot','FontSize',20);
  
endfunction

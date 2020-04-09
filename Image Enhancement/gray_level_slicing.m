function [res1,res2] = gray_level_slicing()

  %%
  % There are two approaches for gray level slicing  
  %
  % 1. Display high value of all gray level in desired intensity range and rest to low value.
  %
  % 2. Display high value of all gray level in desired intensity range and rest to as it is.
  %

  % replace `PATH_TO_IMAGE` with actual image file path
  impath = 'PATH_TO_IMAGE';

  % read image
  img = imread(impath);

  % fetch the dimension of the image
  [nr,nc] = size(img);
    
  res1 = img;
  res2 = img;
  
  % Desired Range Lower Limit [rl] And Upper Limit [rh]
  rl = uint8(60);   % change the lower limit of range from here
  rh = uint8(100);  % change the upper limit of range from here
  
  % Resultant Low value [ansl] And High value [ansh]
  ansh = uint8(200);
  ansl = uint8(40);
  
  for i = 1:nr
    for j = 1:nc
      
      if img(i,j)<=rh && img(i,j)>=rl
        
        res1(i,j) = ansh;
        res2(i,j) = ansh;
      
      else
        
        res1(i,j) = ansl;
        
      endif
        
    endfor
  endfor
  
  % plot the results
  subplot(1,3,1),imshow(img);
  title('Original Gray Image','FontSize',20);
  subplot(1,3,2),imshow(res1);
  title('Approach 1 Gray Image','FontSize',20);
  subplot(1,3,3),imshow(res2);
  title('Approach 2 Gray Image','FontSize',20);
  
endfunction

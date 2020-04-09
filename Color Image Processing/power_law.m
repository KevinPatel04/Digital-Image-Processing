function implt = power_law()

  % replace `PATH_TO_IMAGE` with actual image file path
  impath = 'PATH_TO_IMAGE_FILE';

  % read image
  img = imread(impath);

  % c is a constant
  c = 1

  subplot(2,3,1),imshow(img);
  title('Original Image');
  
  % normalize the image (uint8 to double)
  img = double(img)/255;
  
  % gamma correction array
  gamma = [0.2,0.4,1,2.5,5];
  
  % computing power law for all values of gamma in array
  for i = 1:len(gamma)
    % computing s = c * (r ^ gamma) where r and gamma are positive constants 
    implt = c * (img .^ gamma(i));
    subplot(2,3,i+1),imshow(implt);  
    title(strcat({'Gamma = '},num2str(gamma(i))));
    clear implt;
  endfor
  
endfunction

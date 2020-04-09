function imquantize = qauntization()
  
  % replace `PATH_TO_IMAGE` with actual image file path
  impath = 'PATH_TO_IMAGE';

  % read image
  img = imread(impath);

  % convert rgb image to gray image
  imgray = rgb2gray(img);

  % fetch the dimensions of image
  [nr,nc] = size(imgray);

  for i = 1:nr
      for j = 1:nc
        int = imgray(i,j);
        if int>=0 && int<52
          imquantize(i,j) = 0;
        elseif int>=52 && int<104
          imquantize(i,j) = 52;
        elseif int>=104 && int<156
          imquantize(i,j) = 104;
        elseif int>=156 && int<208
          imquantize(i,j) = 156;
        elseif int>=208 && int<256
          imquantize(i,j)=208;
        endif  
      endfor
  endfor

  % plot the results
  subplot(1,3,1),imshow(img);
  title('Original image');
  subplot(1,3,2),imshow(imgray);
  title('GrayScale image');
  subplot(1,3,3),imshow(imquantize);
  title('Quantized image');
  
endfunction

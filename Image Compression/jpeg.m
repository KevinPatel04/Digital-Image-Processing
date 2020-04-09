function resimg = jpeg()
  
  % replace `PATH_TO_IMAGE` with actual image file
  impath = 'PATH_TO_IMAGE';
  
  % read image
  img = imread(impath);
  
  % convert rgb image to gray scale only if input image is colormap
  % img = rgb2gray(img);
  
  % get the dimensions of image
  [nr,nc] = size(img);
    
  if mod(nr,8)!=0
      
      nr = nr - mod(nr,8);
     
  endif
  
  if mod(nc,8)!=0  
      
      nc = nc - mod(nc,8);
    
  endif
  
  img1=img;
  
  % trim the edges if not multiple of 8  
  impadded(1:nr,1:nc) = double(img(1:nr,1:nc));   
  img = impadded;
  
  
  % fetch the image dimensions
  [nr, nc]= size(img);
  
  % convert image type to double
  img = double(img);
  
  % Subtracting each image pixel value by 128 
  img = img - (128*ones(nr,nc));
  quality = input('What quality of compression you require - ');

  % Quality Matrix Formulation
  Q50 = [ 16 11 10 16 24 40 51 61;
       12 12 14 19 26 58 60 55;
       14 13 16 24 40 57 69 56;
       14 17 22 29 51 87 80 62; 
       18 22 37 56 68 109 103 77;
       24 35 55 64 81 104 113 92;
       49 64 78 87 103 121 120 101;
       72 92 95 98 112 100 103 99];
   
   if quality > 50
       QX = round(Q50.*(ones(8)*((100-quality)/50)));
       QX = uint8(QX);
   elseif quality < 50
       QX = round(Q50.*(ones(8)*(50/quality)));
       QX = uint8(QX);
   elseif quality == 50
       QX = Q50;
   end 
    
      
  % initialize the size of cosine matrix N
  
  N = 8
  
  % generate cosine matrix
  DCT_matrix8 = zeros(N,N);
  
  for i = 1:N
    
    DCT_matrix8(1,i) = sqrt(1/N);
    
  endfor
  
  for i = 2:N
    for j = 1:N
        
      DCT_matrix8(i,j) = sqrt(2/N)*cos(((2*j-1)*pi*(i-1))/(2*N));
        
    endfor
  endfor
  
  % calculate inverse DCT
  iDCT_matrix8 = DCT_matrix8';   %inv(DCT_matrix8);
  
  % Jpeg Compression
  dct_restored = zeros(nr,nc);
  QX = double(QX);
  
  %%
  % Jpeg Encoding
  %
  % Forward Discret Cosine Transform
  for i1=[1:8:nr]
      for i2=[1:8:nc]
          zBLOCK=img(i1:i1+7,i2:i2+7);
          win1=DCT_matrix8*zBLOCK*iDCT_matrix8;
          dct_domain(i1:i1+7,i2:i2+7)=win1;
      end
  end
  %
  % Quantization of the DCT coefficients
  for i1=[1:8:nr]
      for i2=[1:8:nc]
          win1 = dct_domain(i1:i1+7,i2:i2+7);
          win2=round(win1./QX);
          dct_quantized(i1:i1+7,i2:i2+7)=win2;
      end
  end
  
  %%
  % Jpeg Decoding 
  %
  % Dequantization of DCT Coefficients
  for i1=[1:8:nr]
      for i2=[1:8:nc]
          win2 = dct_quantized(i1:i1+7,i2:i2+7);
          win3 = win2.*QX;
          dct_dequantized(i1:i1+7,i2:i2+7) = win3;
      end
  end
  %
  % Inverse DISCRETE COSINE TRANSFORM
  for i1=[1:8:nr]
      for i2=[1:8:nc]
          win3 = dct_dequantized(i1:i1+7,i2:i2+7);
          win4=iDCT_matrix8*win3*DCT_matrix8;
          dct_restored(i1:i1+7,i2:i2+7)=win4;
      end
  end
  resimg=dct_restored;
  
  % conversion of image matrix to uint8 image
  resimg=mat2gray(resimg);
  
  
  % display of results
  subplot(1,2,1),imshow(img1);
  title('Original image','FontSize',18);
  
  subplot(1,2,2),imshow(resimg);
  title('Compressed Image','FontSize',18);

endfunction
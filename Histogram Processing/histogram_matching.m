function [res] = histogram_matching()
  
  %%
  % Histogram matching transform input image such that it's histogram matches specified output image histogram
  %
  
  % replace `PATH_TO_INPUT_IMAGE_FILE` & `PATH_TO_OUTPUT_IMAGE_FILE` with actual image file paths
  inpath = 'PATH_TO_INPUT_IMAGE_FILE';
  outpath = 'PATH_TO_OUTPUT_IMAGE_FILE';
  
  % read image
  img1=imread(inpath);
  img2=imread(outpath);
  
  %%
  % converts rgb image to gray scale image (optional: Use ONLY when your input image is in RGB format)
  % if image is not in RGB format then use:
  % imggray1 = img1;
  %
  imggray1=rgb2gray(img1);
  
  %%
  % converts rgb image to gray scale image (optional: Use ONLY when your output image is in RGB format)
  % if image is not in RGB format then use:
  % imggray2 = img2;
  %
  imggray2=rgb2gray(img2);
  
  % calculate dimesions of both the images
  [nr1,nc1]=size(imggray1);
  [nr2,nc2]=size(imggray2);

  
  %%
  % Plot histogram for input image 
  %
  arr1=zeros(1,256);
  for i = 1:nr1
      for j = 1:nc1
        arr1(imggray1(i,j)+1)=arr1(imggray1(i,j)+1)+1;
      endfor
  endfor

  nk=arr1;
  pk=zeros(1,256);
  res1=zeros(1,256);
  sk=zeros(1,256);
  imgnew1=imggray1;
  n=sum(sum(nk));
  for i=1:256
    pk(i)=nk(i)/n;
    if i>1
      sk(i)=sk(i-1)+pk(i);
    else
      sk(1)=pk(1);
    endif
    ans1(i)=round(255*sk(i));
    res1(ans1(i)+1)=res1(ans1(i)+1)+nk(i);
  endfor

  %%
  % Plot histogram for output image 
  %
  arr2=zeros(1,256);
  for i = 1:nr2
      for j = 1:nc2
        arr2(imggray2(i,j)+1)=arr2(imggray2(i,j)+1)+1;
      endfor
  endfor

  nk=arr2;
  pk=zeros(1,256);
  res2=zeros(1,256);
  sk=zeros(1,256);
  imgnew2=imggray2;
  n=sum(sum(nk));
  for i=1:256
    pk(i)=nk(i)/n;
    if i>1
      sk(i)=sk(i-1)+pk(i);
    else
      sk(1)=pk(1);
    endif
    ans2(i)=round(255*sk(i));
    res2(ans2(i)+1)=res2(ans2(i)+1)+nk(i);
  endfor

  %%
  % Perform histogram matching
  %
  for i = 1:nr1
      for j = 1:nc1
        k = ans1(imggray1(i,j)+1);
        while 1==1
          inx = find(ans2==k);
          if size(inx) != [0 0] 
            imgnew1(i,j)=inx(1,1)-1;
            break;
          else 
            k=k+1;
          endif
        endwhile
      endfor
  endfor

  %%
  % Display the results 
  %
  subplot(2,3,1),imshow(imggray1);
  title('Gray Image 1','FontSize',20);
  subplot(2,3,2),imshow(imggray2);
  title('Gray Image 2','FontSize',20);
  subplot(2,3,4),bar(0:255,arr1,1);
  title('Histogram Image 1','FontSize',20);
  subplot(2,3,5),bar(0:255,arr2,1);
  title('Histogram Image 2','FontSize',20);
  subplot(2,3,6),bar(0:255,res2,1);
  title('Histogram Output','FontSize',20);
  subplot(2,3,3),imshow(imgnew1);
  title('New Image','FontSize',20);

endfunction

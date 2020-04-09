function [res] = histogram_equalization()
  
  % replace `PATH_TO_IMAGE` with actual image file path
  impath = 'PATH_TO_IMAGE_FILE';

  % read image
  img=imread(imgpath);
  
  % converts rgb image to gray scale image (optional)
  imggray=rgb2gray(img);
  
  % find dimension of image
  [nr,nc]=size(imggray);
  
  %%
  % Generate Count array having count of pixels
  %
  
  arr=zeros(1,256);
  for i = 1:nr
      for j = 1:nc
        arr(imggray(i,j)+1)=arr(imggray(i,j)+1)+1;
      endfor
  endfor

  nk=arr;
  pk=zeros(1,256);
  res=zeros(1,256);
  sk=zeros(1,256);
  imgnew=imggray;
  
  % find total number of pixels 
  n=sum(sum(nk));
  
  % generate histogram equalization table
  for i=1:256
    pk(i)=nk(i)/n;
    if i>1
      sk(i)=sk(i-1)+pk(i);
    else
      sk(1)=pk(1);
    endif
    ans(i)=round(255*sk(i));
    res(ans(i)+1)=res(ans(i)+1)+nk(i);
  endfor
  
  % generate a new image
  for i = 1:nr
      for j = 1:nc
        imgnew(i,j)=ans(imggray(i,j)+1);
      endfor
  endfor
  
  % plot the inputs & outputs
  subplot(2,2,1),imshow(imggray);
  title('Gray Image');
  subplot(2,2,3),bar(0:255,arr,1);
  title('Histogram Plot');
  subplot(2,2,4),bar(0:255,res,1);
  title('Histogram Equalization');
  subplot(2,2,2),imshow(imgnew);
  title('New Image');

endfunction

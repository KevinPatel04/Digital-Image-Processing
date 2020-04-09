function res = signature_plotting()
  
  % replace `PATH_TO_IMAGE` with actual image file
  impath = 'PATH_TO_IMAGE';
  
  % read image
  img = imread(impath);
  size(img)
  
  % convert image to BW image
  img = im2bw(img);
  
  % detect boundaries
  [B,L,N] = bwboundaries(img);
  
  % display the image
  imshow(img);
  
  % find all the conected components and mark them
  for cnt = 1:N
    hold on;
    boundary = B{cnt};
    plot(boundary(:,2), boundary(:,1),'r');
    hold on;
    text(mean(boundary(:,2)), mean(boundary(:,1)),num2str(cnt));
  end
  figure;
  subplotrow = ceil(sqrt(N));
  
  % plot signatures for each connected components
  for cnt = 1:N
    boundary = B{cnt};
  
    % calculate distance and angle for the boundary of component from its centriod 
    [th, r]=cart2pol(boundary(:,2)-mean(boundary(:,2)),boundary(:,1)-mean(boundary(:,1)));
    
    % plot the signatures
    subplot(subplotrow,N/subplotrow,cnt);
    plot(th,r,'.');
  
    % adjust axis according to the angle and radius you want
    axis([-pi pi 0 500]);
    
    % give label to axis
    xlabel('radian');ylabel('r');
  
    % give title to plot
    title(['Object ', num2str(cnt)]);
    
  end

endfunction
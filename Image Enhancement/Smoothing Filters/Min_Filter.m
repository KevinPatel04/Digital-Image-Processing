function new_img = Min_Filter() 
    
    %%
    % Non Linear Smoothing Filter
    %
    % Min Filter
    %
    % Define Odd Mask Size 3,5,7,....
    m_size = 3;
    
    % replace `PATH_TO_IMAGE_FILE` with actual image file path
    impath = 'PATH_TO_IMAGE_FILE';

    % read image
    img = imread(impath);
    
    % Convert BGR image to GRAY Scale Image (optional)
    img = rgb2gray(img);
    
    s = m_size/2-0.5;
    
    % Pad The Given Image
    [nr,nc]=size(img);
    padded_img = uint8(zeros(nr+2*s,nc+2*s));
    padded_img((s+1):(nr+s),(s+1):(nc+s)) = img;
    
    % Plot Result 
    subplot(1,3,1),imshow(img);
    title('Original Gray Image','FontSize',18);
    subplot(1,3,2),imshow(padded_img);
    title('Padded Image','FontSize',18);
    
    % Convert uint8 to double
    padded_img=double(padded_img);
    
    % Find Size of Padded Image
    [pnr,pnc]=size(padded_img);

    new_img = zeros(nr,nc);
    
    for i = (1+s):(nr+s)
      for j = (1+s):(nc+s)
        
        new_img(i-s,j-s) = min(min(padded_img(i-s:i+s,j-s:j+s)));
        
      endfor
    endfor

    subplot(1,3,3),imshow(uint8(new_img));
    title('Min Filter','FontSize',18);
    
endfunction

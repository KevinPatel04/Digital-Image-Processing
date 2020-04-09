function imyiq = RGB2NTSC()

  %%
  % |============================================================================
  % | Attribute |                           Description                         |
  % |----------------------------------------------------------------------------
  % |           |                                                               |
  % |           | Luma, or brightness of the image. Values are in the range     |
  % |     Y     | [0, 1], where 0 specifies black and 1 specifies white.        |
  % |           | Colors increase in brightness as Y increases.                 |
  % |___________|_______________________________________________________________|
  % |           |                                                               |
  % |           | In-phase, which is approximately the amount of blue or orange |
  % |           | tones in the image. I in the range [-0.5959, 0.5959], where   |
  % |     I     | negative numbers indicate blue tones and positive numbers     |
  % |           | indicate orange tones. As the magnitude of I increases, the   |
  % |           | saturation of the color increases.                            |
  % |___________|_______________________________________________________________|
  % |           |                                                               |
  % |           | Quadrature, which is approximately the amount of green or     | 
  % |           | purple tones in the image. Q in the range [-0.5229, 0.5229],  |
  % |     Q     | where negative numbers indicate green tones and positive      |
  % |           | numbers indicate purple tones. As the magnitude of Q          |
  % |           | increases, the saturation of the color increases.             |
  % |           |                                                               |
  % |============================================================================
  %

  % replace `PATH_TO_RGB_COLOR_IMAGE` with actual image file
  impath = 'PATH_TO_RGB_COLOR_IMAGE';
  
  % read image
  img = imread(impath);
  
  % convert rgb image to yiq image
  imyiq=rgb2ntsc(img);
  
  % plot the results
  subplot(1,3,1),imshow(img);
  title('Original RGB image','FontSize',18);
  
  subplot(1,3,2),imshow(imyiq);
  title('NTSC image','FontSize',18);
  
  subplot(1,3,3),imshow(imyiq(:,:,1));
  title('Illuminace Component','FontSize',18);

endfunction
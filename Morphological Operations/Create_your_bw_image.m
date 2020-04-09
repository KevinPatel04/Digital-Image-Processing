function img = Create_your_bw_image()

  % create your own B & W image

  % create black square of 400px
  img = zeros(400);

  % create white square of 301px inside previous square
  img(50:350,50:350) = ones(301);

  % create black square of 201px inside previous square
  img(100:300,100:300) = zeros(201); 

  % create white square of 101px inside previous square
  img(150:250,150:250) = ones(101); 

  % save image with name myImage.jpg
  imwrite(img,'myImage.jpg');

  % show image
  imshow(img);
  title('Created B & W Image','FontSize',18);

endfunction

function res = iDCT2(M,N=8) % matrix M on which inverse DCT is to be applied; size of cosine matrix N; 
  
  %%
  %
  % iDCT2 : Inverse Discrete Cosine Transformation
  %
  %
  % generate cosine matrix C
  C = zeros(N,N);
  
  for i = 1:N
    
    C(1,i) = sqrt(1/N);
    
  endfor
  
  for i = 2:N
    for j = 1:N
        
      C(i,j) = sqrt(2/N)*cos(((2*j-1)*pi*(i-1))/(2*N));
        
    endfor
  endfor
  
  % fetch matrix dimensions
  [nr,nc] = size(M);
  
  res = zeros(nr,nc);
  
  %%
  % Apply Inverse DCT
  for i=[1:N:nr]
      for j=[1:N:nc]
          zBLOCK = M(i:i+N-1,j:j+N-1);
          win=C'*zBLOCK*C;
          res(i:i+N-1,j:j+N-1)=win;
      end
  end
  
endfunction
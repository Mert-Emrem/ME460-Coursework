%%%%%%%%%%%%%%%%%%%%%%    Mert Emrem - 250203015    %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%    CE301 - Assignment #3     %%%%%%%%%%%%%%%%%%%%%%

syms T A B C D E F
a = [ 0 0 0 0 0 1;
      T^5 T^4 T^3 T^2 T 1;
      0 0 0 0 1 0;
      5*T^4 4*T^3 3*T^2 2*T 1 0;
      0 0 0 2 0 0;
      20*T^3 12*T^2 6*T 2 0 0];
  
  x = [A; B; C; D; E; F];
  
  x_0 = 125;
  x_1 = 110;
  
  Cond = [x_0; x_1; 0; 0; 0; 0]
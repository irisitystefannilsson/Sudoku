function M = onenumberpersquare()

  M = sparse(9*9, 9*9*9);

  for i = 1:9
    for j = 1:9

      M(i + (j - 1)*9, 1 + (i + (j - 1)*9 - 1)*9:9 + (i + (j - 1)*9 - 1)*9) = 1; 
      
    end
  end

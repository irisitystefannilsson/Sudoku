function M = onenumberpercolumn()

  M = sparse(9*9*36, 9*9*9);
  count = 1;
  
  for i = 1:9
    for k = 1:9
      for j = 1:8
	for dummy = j + 1:9

	  M(count, k + (i + (j - 1)*9 - 1)*9)  = -1;
	  M(count, k + (i + (dummy - 1)*9 - 1)*9)  = -1;
	  count = count + 1;
	  
	end
      end
    end
  end

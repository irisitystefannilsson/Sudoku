function S = translatesat(xijk)

  for i = 1:9
    for j = 1:9
      for k = 1:9
	if xijk(k + (i + (j - 1)*9 - 1)*9) == 1
	  S(i, j) = k;
	end
      end
    end
  end
  

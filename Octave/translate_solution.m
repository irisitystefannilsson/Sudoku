function S = translate_solution(xijk)

  for i = 1:9
    for j = 1:9
      for k = 1:9
	if xijk(i + (j - 1)*9 + (k - 1)*9*9) ~= 0
	  S(i, j) = k;
	end
      end
    end
  end
  

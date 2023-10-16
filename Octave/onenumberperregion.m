function [M N] = onenumberperregion()

  M = sparse(729, 9*9*9);

  count = 1;
  for k = 1:9
    for i = 0:2
      for j = 0:2
	for x = 1:3
	  for y = 1:2
	    for dummy = y + 1:3
	      
	      M(count,  k + (3*i + x + (3*j + y - 1)*9 - 1)*9) = -1;
	      M(count,  k + (3*i + x + (3*j + dummy - 1)*9 - 1)*9) = -1;
	      count = count+1;
	      
	    end
	  end
	end
      end
    end
  end

  N = sparse(2187, 9*9*9);

  count = 1;
  for k = 1:9
    for i = 0:2
      for j = 0:2
	for x = 1:2
	  for y = 1:3
	    for dummy = x + 1:3
	      for l = 1:3

		N(count,  k + (3*i + x + (3*j + y - 1)*9 - 1)*9) = -1;
		N(count,  k + (3*i + dummy + (3*j + l - 1)*9 - 1)*9) = -1;
		count = count + 1;
		
	      end
	    end
	  end
	end
      end
    end
  end

  

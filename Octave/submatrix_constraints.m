function [smc] = submatrix_constraints()

  for subi = 1:3
    for subj = 1:3
      for k = 1:9
	smc(subi + (subj-1)*3 + (k - 1)*9,:) = zeros(1, 9*9*9);
	for i = (subi - 1)*3 + 1:(subi - 1)*3 + 3
	  for j = (subj - 1)*3 + 1:(subj - 1)*3 + 3
	    smc(subi + (subj-1)*3 + (k - 1)*9, i + (j - 1)*9 + (k - 1)*9*9) = 1;
	  end
	end
      end
    end
  end

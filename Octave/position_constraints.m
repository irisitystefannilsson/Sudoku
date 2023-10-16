function [pc] = position_constraints()

  for i = 1:9
    for j = 1:9
      pc(i + (j - 1)*9,:) = zeros(1, 9*9*9);
      for k = 1:9
	pc(i + (j - 1)*9, i + (j - 1)*9 + (k - 1)*9*9) = 1;
      end
    end
  end

function ic = initial_conditions(S)

  ic_size = sum(sum(S ~= 0));
  ic = zeros(ic_size, 9*9*9);

  index = 1;
  for i = 1:9
    for j = 1:9
      if S(i, j) ~= 0;
	ic(index, i + (j - 1)*9 + (S(i, j) - 1)*9*9) = 1;
	index = index + 1;
      end
    end
  end
  

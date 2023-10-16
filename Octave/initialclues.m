function M = initialclues(IC)

  rows = sum(sum(IC ~= 0));

  M = zeros(rows, 9*9*9);

  count = 1;
  for i = 1:9
    for j = 1:9

      if IC(i, j) ~= 0

	M(count, IC(i, j) + (i + (j - 1)*9 - 1)*9) = 1;
	count = count + 1;

      end

    end
  end

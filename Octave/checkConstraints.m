function b = checkConstraints(S, row, col)

  row_box = ceil(row / 3);
  col_box = ceil(col / 3);
  
  i = S(row, col);
				% row check
  if sum(S(row, 1:9) == i) > 1
    b = false;
    return
  end
				% col check
  if sum(S(1:9, col) == i) > 1
    b = false;
    return
  end
				% box check
  if sum(sum(S((row_box-1)*3+1:(row_box-1)*3+3, (col_box-1)*3+1:(col_box-1)*3+3) == i)) > 1
    b = false;
    return
  end
  b = true;

  
  



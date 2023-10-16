function [next_row, next_col] = findNextPlace(S, row, col)
  next_row = row;
  next_col = col;
  while S(next_row, next_col) ~= 0 
    next_row = next_row;
    next_col = next_col + 1;
    if next_col == 10
      next_col = 1;
      next_row = next_row + 1;
    end
    if next_row == 10
      return
    end
  end

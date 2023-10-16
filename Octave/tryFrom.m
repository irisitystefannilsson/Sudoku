function [Sout, finished] = tryFrom(Sin, row, col)

  Sout = Sin;
  finished = false;
  [row, col] = findNextPlace(Sout, row, col);
  if row > 9
    finished = true;
    return
  end
  for num = 1:9
    Sout(row, col) = num;
    %disp(S)
    %fflush(stdout)
    %pause(0.001)
    if checkConstraints(Sout, row, col)
      %disp('going down deeper')
      %fflush(stdout)
      [Sout, finished] = tryFrom(Sout, row, col);
      if finished
	return
      end
    end
  end
  %disp('backtracking')
  %fflush(stdout)
  Sout(row, col) = 0;

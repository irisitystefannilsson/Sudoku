function Solution = iPSolveSudoku(S)

  Solution = S;
  o_function = objective();
  cc = column_constraints();
  rc = row_constraints();
  smc = submatrix_constraints();
  pc = position_constraints();

  ic = initial_conditions(S);

  tot_size = size(cc)(1) + size(rc)(1) + size(smc)(1) + size(pc)(1) + size(ic)(1);

  rhs = ones(1, tot_size)';

  lb = zeros(1, 9*9*9);

  ub = ones(1, 9*9*9);

  ctype(1:tot_size) = "S";

  vartype(1:9*9*9) = "I";

  A = sparse([cc ; rc ; smc ; pc ; ic]);

  xijk = glpk(o_function, A, rhs, lb, ub, ctype, vartype);

  Solution = translate_solution(xijk);
  

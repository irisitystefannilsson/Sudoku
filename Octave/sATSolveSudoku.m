function sol = sATSolveSudoku(IC)

  M = onenumberpersquare();
  M1 = onenumberperrow();
  M2 = onenumberpercolumn();
  [M3 M4] = onenumberperregion();
  M5 = initialclues(IC);

  P = sparse([M ; M1 ; M2 ; M3 ; M4 ; M5]);

  addpath('./veritas/veriT-SAT_Octave_2014_package');
  sat_init();
  
  [res model] = sat_solve(P);

  if res
    sol = translatesat(model);
  else
    disp('Something went wrong!')
    sol = 0;
  end
  
  sat_done();

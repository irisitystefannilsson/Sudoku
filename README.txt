Sudoku solvers implemented in 3 different languages.

For each language (Julia, Python & Octave) there is a brute
force solver (tryFrom), a solver for the Sudoku formulated
as an IP problem. and a solver for the Sudoku formulated as
a SAT problem.
The IP & SAT formulations are based on the 2 attached papers.

To get started:

 * Julia: include("module") & using .module is needed. The
          "bruteForce" module contains some example problems.

 * Python: import the different modules. "sudoku_bruteforce"
           contains some example problems.

 * Octave: "S.mat" contains example problems. The SAT solver
           in the veritas directory might need to be recompiled
	   into a mex-file.
	   



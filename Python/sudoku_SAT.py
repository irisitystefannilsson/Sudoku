from pysat.solvers import Solver
import numpy as np

def add_column_clauses(m):
    for i in range(0, 9):
        for k in range(1, 10):
            for j in range(0, 8):
                for dummy in range(j + 1, 9):
                    m.add_clause([-(k + (i + j*9)*9), -(k + (i + dummy*9)*9)]) 


def add_row_clauses(m):
    for j in range(0, 9):
        for k in range(1, 10):
            for i in range(0, 8):
                for dummy in range(i + 1, 9):
                    m.add_clause([-(k + (i + j*9)*9), -(k + (dummy + j*9)*9)]) 

              
def add_box_clauses(m):
    for i in range(0, 9):
        for j in range(0, 9):
            clause = []
            for k in range(1, 10):
                clause.append((k + (i + j*9)*9))
            m.add_clause(clause)


def add_subregion_clauses(m):
    for k in range(1, 10):
        for i in range(0, 3):
            for j in range(0, 3):
                for x in range(0, 3):
                    for y in range(0, 3):
                        for dummy in range(y + 1, 3):
                            m.add_clause([-(k + (3*i + x + (3*j + y)*9)*9), -(k + (3*i + x + (3*j + dummy)*9)*9)]) 

    for k in range(1, 10): 
        for i in range(0, 3):
            for j in range(0, 3):
                for x in range(0, 3):
                    for y in range(0, 3):
                        for dummy in range(x + 1, 3):
                            for l in range(0, 3):
                                m.add_clause([-(k + (3*i + x + (3*j + y)*9)*9), -(k + (3*i + dummy + (3*j + l)*9)*9)])


def add_initial_clauses(m, S):
  for i in range(0, 9):
      for j in range(0, 9):
          if S[i, j] != 0:
              m.add_clause([int(S[i, j]) + (i + j*9)*9])


def translate_solution(m):
    S = np.ndarray([9, 9])

    model = m.get_model()
    for i in range(0, 9):
        for j in range(0, 9):
            for k in range(1, 10):
                if model[k + (i + j*9)*9 - 1] > 0:
                    S[i, j] = k
    return S


def solve_sudoku(S):
    sat_solver = Solver(name='g4')
    add_box_clauses(sat_solver)
    add_subregion_clauses(sat_solver)
    add_column_clauses(sat_solver)
    add_row_clauses(sat_solver)
    add_initial_clauses(sat_solver, S)
    sat_solver.solve()
    m = translate_solution(sat_solver)
    return m

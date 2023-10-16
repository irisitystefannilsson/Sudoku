from mip import *
import numpy as np


def objective(m):
    m.objective = xsum(0*m.vars[i] for i in range(9*9*9))


def column_constraints(m):
    for j in range(0, 9):
        for k in range(1, 10):
            m += xsum(m.vars[i + j*9 + (k - 1)*9*9] for i in range(0, 9)) == 1


def row_constraints(m):
    for i in range(0, 9):
        for k in range(1, 10):
            m += xsum(m.vars[i + j*9 + (k - 1)*9*9] for j in range(0, 9)) == 1
            
  
def submatrix_constraints(m):
    for subi in range(0, 3):
        for subj in range (0, 3):
            for k in range(1, 10):
                m += xsum(m.vars[i + j*9 + (k - 1)*9*9] for i in range(subi*3, subi*3 + 3) for j in range(subj*3, subj*3 + 3)) == 1


def position_constraints(m):
    for i in range(0, 9):
        for j in range(0, 9):
            m += xsum(m.vars[i + j*9 + (k - 1)*9*9] for k in range(1, 10)) == 1


def initial_conditions(m, S):
    for i in range(0, 9):
        for j in range(0, 9):
            if S[i, j] != 0:
                m += m.vars[i + j*9 + (int(S[i, j] - 1))*9*9] == 1


def setup_problem(S):
    m = Model()
    y = [m.add_var(var_type=BINARY) for i in range(9*9*9)]
    objective(m)
    column_constraints(m)
    row_constraints(m)
    submatrix_constraints(m)
    position_constraints(m)
    initial_conditions(m, S)

    return m


def translate_solution(m):
    S = np.ndarray([9, 9])
    
    for i in range(0, 9):
        for j in range(0, 9):
            for k in range(1, 10):
                if m.vars[i + j*9 + (k - 1)*9*9].x != 0:
                    S[i, j] = k
    return S


def solve_sudoku(S):
    m = setup_problem(S)
    m.optimize()
    S = translate_solution(m)
    return S

import math
import numpy

def createInitialConditions():
    S_latt = numpy.ndarray([9, 9])
    S_latt[0] = [0,   0,   6,   5,   0,   0,   0,   0,   4]
    S_latt[1] = [5,   0,   9,   0,   2,   4,   0,   0,   6]
    S_latt[2] = [0  , 0  , 8  , 7  , 0  , 0  , 2,   5,   0]
    S_latt[3] = [0  , 6  , 0  , 0  , 0  , 0  , 0  , 8  , 0]
    S_latt[4] = [4 ,  8  , 0  , 1  , 0  , 3  , 0  , 0 ,  0]
    S_latt[5] = [0 ,  5  , 0  , 2  , 0  , 8  , 6  , 7  , 1]
    S_latt[6] = [6  , 0  , 0  , 0  , 0  , 0  , 1 ,  0  , 0]
    S_latt[7] = [0  , 9  , 0  , 4  , 5  , 1  , 0  , 0  , 7]
    S_latt[8] = [0  , 3  , 4  , 0  , 8 ,  0  , 0  , 0 ,  2]

    S_medel1 = numpy.ndarray([9, 9])
    S_medel1[0] = [0,   9,   0,   0,   0,   0,   0,   5,   8]
    S_medel1[1] = [0,   0,   1,   0,   6,   0,   3,   0,   0]
    S_medel1[2] = [4  , 0  , 0  , 9  , 0  , 5  , 0,   0,   0]
    S_medel1[3] = [0  , 0  , 4  , 0  , 0  , 0  , 8  , 3  , 1]
    S_medel1[4] = [6 ,  0  , 0  , 0  , 0  , 8  , 0  , 0 ,  0]
    S_medel1[5] = [8 ,  3  , 5  , 0  , 4  , 1  , 0  , 0  , 0]
    S_medel1[6] = [0  , 0  , 0  , 0  , 3  , 7  , 0 ,  8  , 5]
    S_medel1[7] = [0  , 0  , 0  , 1  , 0  , 0  , 0  , 0  , 0]
    S_medel1[8] = [3  , 0  , 9  , 4  , 8 ,  0  , 6  , 0 ,  0]

    S_medel2 = numpy.ndarray([9, 9])
    S_medel2[0] = [6,   0,   0,   2,   0,   0,   8,   0,   7]
    S_medel2[1] = [5,   1,   0,   0,   0,   7,   0,   3,   0]
    S_medel2[2] = [8  , 0  , 7  , 0  , 6  , 1  , 0,   0,   0]
    S_medel2[3] = [9  , 2  , 0  , 5  , 0  , 4  , 1  , 0  , 0]
    S_medel2[4] = [3 ,  0  , 0  , 0  , 0  , 0  , 0  , 0 ,  8]
    S_medel2[5] = [0 ,  0  , 0  , 1  , 0  , 0  , 2  , 0  , 0]
    S_medel2[6] = [7  , 0  , 3  , 6  , 0  , 8  , 0 ,  0  , 1]
    S_medel2[7] = [0  , 0  , 5  , 0  , 0  , 3  , 0  , 0  , 0]
    S_medel2[8] = [0  , 0  , 0  , 0  , 5 ,  0  , 0  , 2 ,  0]

    S_svar1 = numpy.ndarray([9, 9])
    S_svar1[0] = [0,   7,   0,   6,   0,   8,   0,   4,   0]
    S_svar1[1] = [0,   0,   0,   0,   4,   0,   9,   0,   0]
    S_svar1[2] = [0  , 0  , 0  , 0  , 5  , 0  , 0,   0,   2]
    S_svar1[3] = [9  , 0  , 0  , 0  , 3  , 0  , 0  , 0  , 6]
    S_svar1[4] = [0 ,  0  , 5  , 8  , 0  , 0  , 7  , 0 ,  0]
    S_svar1[5] = [0 ,  0  , 0  , 0  , 0  , 0  , 4  , 9  , 0]
    S_svar1[6] = [0  , 0  , 0  , 7  , 0  , 0  , 0 ,  8  , 9]
    S_svar1[7] = [0  , 0  , 0  , 0  , 0  , 9  , 0  , 0  , 0]
    S_svar1[8] = [0  , 0  , 8  , 2  , 0 ,  3  , 5  , 7 ,  0]

    S_svar2 = numpy.ndarray([9, 9])
    S_svar2[0] = [0,   0,   0,   3,   0,   0,   0,   7,   4]
    S_svar2[1] = [0,   0,   1,   0,   0,   0,   0,   0,   0]
    S_svar2[2] = [0  , 0  , 0  , 0  , 2  , 0  , 5,   0,   3]
    S_svar2[3] = [0  , 7  , 2  , 0  , 0  , 5  , 0  , 6  , 0]
    S_svar2[4] = [0 ,  0  , 4  , 0  , 0  , 0  , 0  , 0 ,  2]
    S_svar2[5] = [0 ,  0  , 0  , 0  , 0  , 0  , 7  , 0  , 0]
    S_svar2[6] = [3  , 6  , 0  , 0  , 5  , 0  , 4 ,  0  , 8]
    S_svar2[7] = [4  , 0  , 0  , 0  , 1  , 0  , 0  , 0  , 0]
    S_svar2[8] = [1  , 0  , 0  , 6  , 3 ,  0  , 0  , 0 ,  5]

    S_supersvar = numpy.ndarray([9, 9])
    S_supersvar[0] = [0,   4,   0,   0,   0,   0,   0,   2,   0]
    S_supersvar[1] = [7,   0,   8,   0,   2,   0,   1,   0,   0]
    S_supersvar[2] = [2  , 0  , 1  , 0  , 6  , 0  , 9,   0,   0]
    S_supersvar[3] = [5  , 8  , 0  , 0  , 0  , 0  , 7  , 0  , 9]
    S_supersvar[4] = [0 ,  0  , 0  , 0  , 0  , 8  , 0  , 0 ,  0]
    S_supersvar[5] = [0 ,  0  , 0  , 0  , 0  , 0  , 0  , 0  , 0]
    S_supersvar[6] = [1  , 0  , 2  , 0  , 7  , 0  , 0 ,  0  , 5]
    S_supersvar[7] = [9  , 0  , 0  , 0  , 0  , 4  , 0  , 0  , 1]
    S_supersvar[8] = [0  , 0  , 0  , 0  , 0 ,  1  , 6  , 0 ,  7]

    return (S_latt, S_medel1, S_medel2, S_svar1, S_svar2, S_supersvar)

def checkConstraints(S, row, col):

    i = S[row, col]
    # row check
    if sum(S[row] == i) > 1:
        b = False
        return b
    
    # col check
    if sum(S[:, col] == i) > 1:
        b = False
        return b

    # box check
    row_box = int(math.floor(row / 3))
    col_box = int(math.floor(col / 3))
  
    if sum(sum(S[(row_box*3):(row_box*3+3), (col_box*3):(col_box*3+3)] == i)) > 1:
        b = False
        return b

    b = True
    return b

def checkSolution(S):
    valid = True
    for x in range(0, 9):
        for y in range(0, 9):
            valid = checkConstraints(S, x, y)
            if not valid:
                return (valid, x, y)

    return (valid, 9, 9)
                             
def findNextPlace(S, row, col):
    next_row = row
    next_col = col
    while S[next_row, next_col] != 0: 
        next_row = next_row
        next_col = next_col + 1
        if next_col == 9:
            next_col = 0
            next_row = next_row + 1
        if next_row == 9:
            return (next_row, next_col)

    return (next_row, next_col)

def tryFrom(Sin, row, col):

    Sout = Sin
    finished = False
    row, col = findNextPlace(Sout, row, col)
    if row > 8:
        finished = True
        return (Sout, finished)

    for num in range(1, 10):
        Sout[row, col] = num
        #print(Sout)

        if checkConstraints(Sout, row, col):
            #print('going down deeper')
            Sout, finished = tryFrom(Sout, row, col)
            if finished:
                return (Sout, finished)
    #print('backtracking')
    Sout[row, col] = 0
    return (Sout, finished)

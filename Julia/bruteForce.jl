module bruteForceSudoku

export checkConstraints, findNextPlace, tryFrom, definePuzzles

function definePuzzles()

    S_latt = Array{Int64}(undef,9,9)
    S_latt[:,:] = [0   0   6   5   0   0   0   0   4;
                   5   0   9   0   2   4   0   0   6;
                   0   0   8   7   0   0   2   5   0;
                   0   6   0   0   0   0   0   8   0;
                   4   8   0   1   0   3   0   0   0;
                   0   5   0   2   0   8   6   7   1;
                   6   0   0   0   0   0   1   0   0;
                   0   9   0   4   5   1   0   0   7;
                   0   3   4   0   8   0   0   0   2]
    S_medel1 = Array{Int64}(undef,9,9)
    S_medel1[:,:] = [0   9   0   0   0   0   0   5   8;
                     0   0   1   0   6   0   3   0   0;
                     4   0   0   9   0   5   0   0   0;
                     0   0   4   0   0   0   8   3   1;
                     6   0   0   0   0   8   0   0   0;
                     8   3   5   0   4   1   0   0   0;
                     0   0   0   0   3   7   0   8   5;
                     0   0   0   1   0   0   0   0   0;
                     3   0   9   4   8   0   6   0   0]
    S_medel2 = Array{Int64}(undef,9,9)
    S_medel2[:,:] = [6   0   0   2   0   0   8   0   7;
                     5   1   0   0   0   7   0   3   0;
                     8   0   7   0   6   1   0   0   0;
                     9   2   0   5   0   4   1   0   0;
                     3   0   0   0   0   0   0   0   8;
                     0   0   0   1   0   0   2   0   0;
                     7   0   3   6   0   8   0   0   1;
                     0   0   5   0   0   3   0   0   0;
                     0   0   0   0   5   0   0   2   0]
    S_svar1 = Array{Int64}(undef,9,9)
    S_svar1[:,:] = [0   7   0   6   0   8   0   4   0;
                    0   0   0   0   4   0   9   0   0;
                    0   0   0   0   5   0   0   0   2;
                    9   0   0   0   3   0   0   0   6;
                    0   0   5   8   0   0   7   0   0;
                    0   0   0   0   0   0   4   9   0;
                    0   0   0   7   0   0   0   8   9;
                    0   0   0   0   0   9   0   0   0;
                    0   0   8   2   0   3   5   7   0]
    S_svar2 = Array{Int64}(undef,9,9)
    S_svar2[:,:] = [0   0   0   3   0   0   0   7   4;
                    0   0   1   0   0   0   0   0   0;
                    0   0   0   0   2   0   5   0   3;
                    0   7   2   0   0   5   0   6   0;
                    0   0   4   0   0   0   0   0   2;
                    0   0   0   0   0   0   7   0   0;
                    3   6   0   0   5   0   4   0   8;
                    4   0   0   0   1   0   0   0   0;
                    1   0   0   6   3   0   0   0   5]
    S_supersvar = Array{Int64}(undef,9,9)
    S_supersvar[:,:] = [0   4   0   0   0   0   0   2   0;
                        7   0   8   0   2   0   1   0   0;
                        2   0   1   0   6   0   9   0   0;
                        5   8   0   0   0   0   7   0   9;
                        0   0   0   0   0   8   0   0   0;
                        0   0   0   0   0   0   0   0   0;
                        1   0   2   0   7   0   0   0   5;
                        9   0   0   0   0   4   0   0   1;
                        0   0   0   0   0   1   6   0   7]

    return (S_latt, S_medel1, S_medel2, S_svar1, S_svar2, S_supersvar)
    
end


function checkConstraints(S::Array{Int64}, row::Int64, col::Int64)

    row_box = Int64(ceil(row / 3))
    col_box = Int64(ceil(col / 3))
  
    i = S[row, col]
    # row check
    if sum(S[row, :] .== i) > 1
        return false
    end
    # col check
    if sum(S[:,col] .== i) > 1
        return false
    end
    # box check
    if sum((S[(row_box-1)*3+1:(row_box-1)*3+3, (col_box-1)*3+1:(col_box-1)*3+3] .== i)) > 1
        return false
    end
    return true

end


function findNextPlace(S::Array{Int64}, row::Int64, col::Int64)

    next_row = row
    next_col = col
    while S[next_row, next_col] != 0 
        next_row = next_row
        next_col = next_col + 1
        if next_col == 10
            next_col = 1
            next_row = next_row + 1
        end
        if next_row == 10
            return (next_row, next_col)
        end
    end
    return (next_row, next_col)

end


function tryFrom(Sin::Array{Int64}, row::Int64, col::Int64)

    Sout = Sin
    finished = false
    (row, col) = findNextPlace(Sout, row, col)
    if row > 9
        finished = true
        return (Sout, finished)
    end
    for num in 1:9
        Sout[row, col] = num
        #println(Sout)
        if checkConstraints(Sout, row, col)
            #println("going down deeper")
            #println(row, ", ", col)
            (Sout, finished) = tryFrom(Sout, row, col)
            if finished
	        return (Sout, finished)
            end
        end
    end
    #println("backtracking")
    Sout[row, col] = 0
    return (Sout, false)
    
end

end

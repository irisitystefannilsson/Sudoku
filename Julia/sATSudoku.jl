module sATSudoku

import PicoSAT

export solve_sudoku

function add_column_clauses(m::Array{Any})

    for i in 1:9
        for k in 1:9
            for j in 1:8
                for dummy in (j + 1):9
                    append!(m, [[-(k + (i-1 + (j-1)*9)*9), -(k + (i-1 + (dummy-1)*9)*9)]]) 
                end
            end
        end
    end

end

function add_row_clauses(m::Array{Any})
    
    for j in 1:9
        for k in 1:9
            for i in 1:9
                for dummy in (i + 1):9
                    append!(m, [[-(k + (i-1 + (j-1)*9)*9), -(k + (dummy-1 + (j-1)*9)*9)]]) 
                end
            end
        end
    end

end

              
function add_box_clauses(m::Array{Any})
    for i in 1:9
        for j in 1:9
            clause = Array{Any}(undef,9)
            for k in 1:9
                clause[k] = (k + (i-1 + (j-1)*9)*9)
            end
            append!(m,[clause])
        end
    end

end

function add_subregion_clauses(m::Array{Any})

    for k in 1:9
        for i in 0:2
            for j in 0:2
                for x in 1:3
                    for y in 1:2
                        for dummy in (y + 1):3
                            append!(m, [[-(k + (3*i + x-1 + (3*j + (y-1))*9)*9), -(k + (3*i + x-1 + (3*j + (dummy-1))*9)*9)]])
                        end
                    end
                end
            end
        end
    end
    for k in 1:9
        for i in 0:2
            for j in 0:2
                for x in 1:2
                    for y in 1:3
                        for dummy in (x + 1):3
                            for l in 1:3
                                append!(m, [[-(k + (3*i + x-1 + (3*j + y-1)*9)*9), -(k + (3*i + dummy-1 + (3*j + l-1)*9)*9)]])
                            end
                        end
                    end
                end
            end
        end
    end

end


function add_initial_clauses(m::Array{Any}, S::Array{Int64})
    
  for i in 1:9
      for j in 1:9
          if S[i, j] != 0
              append!(m, [[S[i, j] + (i-1 + (j-1)*9)*9]])
          end
      end
  end

end


function translate_solution(sol::Array{Int64})

    S = Array{Int64}(undef,9,9)

    for i in 1:9
        for j in 1:9
            for k in 1:9
                if sol[k + (i-1 + (j-1)*9)*9] > 0
                    S[i, j] = k
                end
            end
        end
    end
    return S

end

function solve_sudoku(S::Array{Int64})

    clauses = []
    add_box_clauses(clauses)
    add_subregion_clauses(clauses)
    add_column_clauses(clauses)
    add_row_clauses(clauses)
    add_initial_clauses(clauses, S)
    sol = PicoSAT.solve(clauses)
    m = translate_solution(sol)
    return m

end

end

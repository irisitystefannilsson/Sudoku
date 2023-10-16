module ipSudoku

using GLPK
using JuMP

export setup_and_solve_ip

function setup_and_solve_ip(S::Array{Int64})

    m = Model(GLPK.Optimizer)
    @variable(m, x[1:9, 1:9, 1:9], Bin)
    coeffs = Array{Int64}(undef,9,9,9)
    coeffs[:,:,:] = zeros(9,9,9)
    @objective(m, Max, sum(x.*coeffs))
    # columns
    for j in 1:9
        for k in 1:9
            @constraint(m, sum(x[i,j,k] for i in 1:9) == 1)
        end
    end
    # rows
    for i in 1:9
        for k in 1:9
            @constraint(m, sum(x[i,j,k] for j in 1:9) == 1)
        end
    end
    # subregions
    for si in 1:3
        for sj in 1:3
            for k in 1:9
                @constraint(m, sum(x[(si-1)*3+i,(sj-1)*3+j,k] for i in 1:3, j in 1:3) == 1)
            end
        end
    end
    # one number per box
    for i in 1:9
        for j in 1:9
            @constraint(m, sum(x[i,j,k] for k in 1:9) == 1)
        end
    end
    # initial conditions
    for i in 1:9
        for j in 1:9
            if S[i,j] != 0
                @constraint(m, x[i,j,S[i,j]] == 1)
            end
        end
    end

    optimize!(m)

    sol = value.(x)

    S = Array{Int64}(undef,9,9)
    for i in 1:9
        for j in 1:9
            for k in 1:9
                if sol[i,j,k] == 1
                    S[i,j] = k
                end
            end
        end
    end

    return S
    
end


end

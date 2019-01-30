function imagesc(A::AbstractMatrix)
    Ny, Nx = size(A)

    if Nx > 30
        k = ceil(Nx / 30)
        A = A[:, 1:k:Nx]
    end

    if Ny > 30
        k = ceil(Ny / 30)
        A = A[1:k:Ny, :]
    end

    Ny, Nx = size(A)

    io = IOBuffer()

    t1 = quantile(A[:], 0.2)
    t2 = quantile(A[:], 0.4)
    t3 = quantile(A[:], 0.6)
    t4 = quantile(A[:], 0.8)

    print(io, "\n\n")

    for i = 1:Ny
        print(io, "\t")
        for j = 1:Nx
            if A[i, j] <= t1
                print(io, "  ")
            elseif A[i, j] <= t2
                print(io, ". ")
            elseif A[i, j] <= t3
                print(io, "+ ")
            elseif A[i, j] <= t4
                print(io, "# ")
            else
                print(io, "@#")
            end
        end
        print(io, "\n")
    end

    print(io, "\n")

    return ASCIIPlot(String(take!(io)))
end

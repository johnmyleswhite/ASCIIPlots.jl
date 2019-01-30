function lineplot(x::AbstractArray, y::AbstractArray)
    x, y = vec(x), vec(y)

    # Sanity checking
    N = length(x)
    if N != length(y)
        error("x and y must have the same length")
    end

    # Resolution along x and y dimensions
    res_x, res_y = 60, 20

    # Sort the points to make slopes easier to calculate
    ind = sortperm(x)
    x = x[ind]
    y = y[ind]

    # Standarize data scale
    minx = minimum(x)
    maxx = maximum(x)
    miny = minimum(y)
    maxy = maximum(y)
    x = x .- minx
    x = x / maximum(x)
    y = y .- miny
    y = y / maximum(y)

    # Snap data points to a grid
    xi = floor.(Integer, x * (res_x - 1)) .+ 1
    yi = floor.(Integer, y * (res_y - 1)) .+ 1

    # Compute slope and non-empty points
    dy = diff([y; 2 * y[end] - y[end - 1]]) ./
        max.(diff([x; 2 * x[end] - x[end - 1]]), 1 / N)
    S = zeros(res_y, res_x)
    A = zeros(res_y, res_x)
    for i in 1:N
        S[yi[i], xi[i]] = dy[i]
        A[yi[i], xi[i]] = 1
    end

    io = IOBuffer()

    print(io, "\n")

    # Top grid line
    print(io, "\t")
    for j = 1:(res_x + 1)
        print(io, "-")
    end
    print(io, "\n")

    for i = res_y:-1:1
        # Left grid line
        print(io, "\t|")

        # Data points
        for j = 1:res_x
            if A[i, j] == 1
                if S[i, j] < -0.5
                    print(io, "\\")
                elseif S[i, j] < 0.5
                    print(io, "-")
                else
                    print(io, "/")
                end
            else
                print(io, " ")
            end
        end

        # Right grid line + Y tick marks
        if i == res_y
            @printf io "| %2.2f\n" maxy
        elseif i == 1
            @printf io "| %2.2f\n" miny
        else
            print(io, "|\n")
        end
    end

    # Bottom grid line
    print(io, "\t")
    for j = 1:(res_x + 1)
        print(io, "-")
    end
    print(io, "\n")

    # X tick marks
    @printf io "\t%2.2f" minx
    for j = 1:(res_x - 8)
        print(io, " ")
    end
    @printf io "%2.2f" maxx
    print(io, "\n")

    return ASCIIPlot(String(take!(io)))
end

lineplot(y::AbstractArray) = lineplot([1:length(y);], y)

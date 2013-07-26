function scatterplot(x::AbstractVector, y::AbstractVector; sym::Char = '^')
    # Sanity checking
    N = length(x)
    if N != length(y)
        error("x and y must have the same length")
    end

    # Resolution along x and y dimensions
    res_x, res_y = 60, 20

    # Standarize data scale
    minx = min(x)
    maxx = max(x)
    miny = min(y)
    maxy = max(y)
    x = x - minx
    x = x / max(x)
    y = y - miny
    y = y / max(y)

    # Snap data points to a grid
    xi = ifloor(x * (res_x - 1)) + 1
    yi = ifloor(y * (res_y - 1)) + 1

    # Is there a point at location (i, j)?
    A = zeros(res_y, res_x)
    for i in 1:N
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
                print(io, sym)
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

    # Tick marks for X axis
    @printf io "\t%2.2f" minx
    for j = 1:(res_x - 8)
        print(io, " ")
    end
    @printf io "%2.2f" maxx

    print(io, "\n")

    return ASCIIPlot(bytestring(io))
end

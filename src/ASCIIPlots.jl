module ASCIIPlots
    using Compat
    
    export ASCIIPlot
    export imagesc, lineplot, scatterplot

    immutable ASCIIPlot
        s::ASCIIString
    end

    Base.show(io::IO, p::ASCIIPlot) = print(io, p.s)

    include("imagesc.jl")
    include("lineplot.jl")
    include("scatterplot.jl")
end

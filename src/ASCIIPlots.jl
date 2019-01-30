module ASCIIPlots
    using Printf, Statistics
    
    export ASCIIPlot
    export imagesc, lineplot, scatterplot

    struct ASCIIPlot
        s::String
    end

    Base.show(io::IO, p::ASCIIPlot) = print(io, p.s)

    include("imagesc.jl")
    include("lineplot.jl")
    include("scatterplot.jl")
end

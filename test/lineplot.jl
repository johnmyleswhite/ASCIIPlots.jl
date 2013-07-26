using ASCIIPlots
using Base.Test

x = randn(20)
y = 21.0 * x + randn(20)
lineplot(x, y)

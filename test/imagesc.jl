using ASCIIPlots
using Base.Test

A = eye(10)
p = imagesc(A)
@test p.s == "\n\n\t@#                  \n\t  @#                \n\t    @#              \n\t      @#            \n\t        @#          \n\t          @#        \n\t            @#      \n\t              @#    \n\t                @#  \n\t                  @#\n\n"

A = eye(20)
imagesc(A)

A = eye(10)
imagesc(A)
A[10, 1] = 1
A[1, 10] = 1
imagesc(A)

A = randn(10, 10)
imagesc(A)

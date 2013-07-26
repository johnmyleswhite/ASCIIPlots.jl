ASCIIPlots.jl
=============

Generate basic plots in Julia as ASCII art in the Julia REPL. This is based on code by Billou Bielour.

# Usage Examples

We'll start with `imagesc`:

	using ASCIIPlots

	A = eye(10)
	imagesc(A)

This evaluates to,

	julia> imagesc(A)


		@#                  
		  @#                
		    @#              
		      @#            
		        @#          
		          @#        
		            @#      
		              @#    
		                @#  
		                  @#



Then we'll change the data a bit and replot it:

	A[10, 1] = 1
	A[1, 10] = 1
	imagesc(A)

This evaluates to,

	julia> imagesc(A)


		@#                @#
		  @#                
		    @#              
		      @#            
		        @#          
		          @#        
		            @#      
		              @#    
		                @#  
		@#                @#


Now we'll make a `lineplot` and a `scatterplot`:

	x = 2 * pi * rand(30)
	y = sin(x) + 0.1 * randn(30)

	lineplot(x, y)

This evaluates to,

	julia> lineplot(x, y)

		-------------------------------------------------------------
		|             \                                              | 1.01
		|         \/                                                 |
		|          /                                                 |
		|     /  /                                                   |
		|                                                            |
		|  /                                                         |
		|                                                            |
		|                                                            |
		|/                                                           |
		|                                                            |
		|                                                          \ |
		|                               \                        \  \|
		|                              -                          /  |
		|                                                            |
		|                                   \                 /      |
		|                                    \               /       |
		|                                     \           /\         |
		|                                                   /        |
		|                                         -  \ /             |
		|                                      /       /             | -1.16
		-------------------------------------------------------------
		0.13                                                    6.19


Then we'll do a scatterplot:

	scatterplot(x, y)

This evaluates to,

	julia> scatterplot(x, y)

		-------------------------------------------------------------
		|             ^                                              | 1.01
		|         ^^                                                 |
		|          ^                                                 |
		|     ^  ^                                                   |
		|                                                            |
		|  ^                                                         |
		|                                                            |
		|                                                            |
		|^                                                           |
		|                                                            |
		|                                                          ^ |
		|                               ^                        ^  ^|
		|                              ^                          ^  |
		|                                                            |
		|                                   ^                 ^      |
		|                                    ^               ^       |
		|                                     ^           ^^         |
		|                                                   ^        |
		|                                         ^  ^ ^             |
		|                                      ^       ^             | -1.16
		-------------------------------------------------------------
		0.13                                                    6.19


We can control the glyph being used:

	scatterplot(x, y, sym = '*')

This evaluates to,

	julia> scatterplot(x, y, sym = '*')

		-------------------------------------------------------------
		|             *                                              | 1.01
		|         **                                                 |
		|          *                                                 |
		|     *  *                                                   |
		|                                                            |
		|  *                                                         |
		|                                                            |
		|                                                            |
		|*                                                           |
		|                                                            |
		|                                                          * |
		|                               *                        *  *|
		|                              *                          *  |
		|                                                            |
		|                                   *                 *      |
		|                                    *               *       |
		|                                     *           **         |
		|                                                   *        |
		|                                         *  * *             |
		|                                      *       *             | -1.16
		-------------------------------------------------------------
		0.13                                                    6.19



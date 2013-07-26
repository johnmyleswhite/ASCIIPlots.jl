for path in readdir("test")
	include(joinpath("test", path))
end

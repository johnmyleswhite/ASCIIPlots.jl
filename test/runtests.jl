test_path = dirname(@__FILE__)
for test_file in readdir(test_path)
    test_file == "runtests.jl" && continue
    @show test_file
    include(joinpath(test_path, test_file))
end
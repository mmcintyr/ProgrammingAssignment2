# Test matrix caching code
test = function(mat){

    temp = makeCacheMatrix(mat)

    start.time = Sys.time()
    cacheSolve(temp)
    dur = Sys.time() - start.time
    print(dur)

    start.time = Sys.time()
    cacheSolve(temp)
    dur = Sys.time() - start.time
    print(dur)
}

# Let's create a matrix for testing
set.seed(52798315)
data <- runif(1000*1000)
mat <- matrix(data, nrow=1000, ncol=1000)

test(mat)

# This function creates a special "matrix" object that can cache its inverse
# In this example we introduce the  <<-  operator which can be used to assign a
# value to an object in an environment that is different from the current environment.
# Below are two functions that are used to create a special object that stores a matrix
# and caches its inverse.
#
# The first function,  makeCacheMatrix creates a special "matrix", which is really a
# list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of the inverse of the matrix
# 4. get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    inverseOfMatrix <- NULL
    set <- function(y) {
        x <<- y
        inverseOfMatrix <<- NULL
    }

    get <- function() x
    setMatrixInverse <- function(m)
    {
        inverseOfMatrix <<- solve(m)
    }
    getMatrixInverse <- function()
    {
        inverseOfMatrix
    }

    # Finally, let's return a list containing these functions
    list(set=set, get=get, setMatrixInverse=setMatrixInverse, getMatrixInverse=getMatrixInverse)
}


# This function computes the inverse of the special "matrix" returned by
# makeCacheMatrix  above. If the inverse has already been calculated (and the
# matrix has not changed), then  cacheSolve  should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inverseOfMatrix <- x$getMatrixInverse()

    # If we've already calculated the inverse, no need to do it again. Grab the cached value
    if(!is.null(inverseOfMatrix))
    {
        # Grabbing from the cache
        message("getting cached data")
        return(inverseOfMatrix)
    }

    # OK, we're going to have to do this as there is no cached value
    m.data = x$get()
    inverseOfMatrix = solve(m.data, ...)

    # Cache the value for next time (possibly)
    x$setMatrixInverse(inverseOfMatrix)

    return(inverseOfMatrix)
}

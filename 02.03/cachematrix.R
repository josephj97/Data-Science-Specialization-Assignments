## Couple of functions that calculate the inverse of the matrix and cache it

##  This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(matrix){
        x <<- matrix
        inv <<- NULL
    }
    get <- function(){
        x
    }
    setInverse <- function(inverse){
        inv<<- inverse
    }
    getInverse <- function(){
        inv
    }
    matrix(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## This function computes the inverse of the special "matrix" returned by
## "makeCacheMatrix" above. If the inverse has already been calculated (and the matrix
## has not changed), then the "cacheSolve" should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    m <- x$getInverse()
    if(!is.null(m)){
        message("Getting cached data")
        return(m)
    }
    data <- x$get
    m <- matrix(data)
    x$setInverse(m)
    m
    ## Return a matrix that is the inverse of 'x'
}

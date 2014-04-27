#!/usr/bin/R
#
# this script contain 2 functions to create a cache for inverted Matrix
# 



## This function make inverted cached Matrix
makeCacheMatrix <- function(x = matrix()) {
    ## set cache to null
    cached_matrix <- NULL
    
    ## set matrix and cache
    set <- function(y) {
        x <<- y
        cached_matrix <<- NULL
    }
    
    ## get matrix
    get <- function() { 
        x
    }
    
    ## set inverse to cached matrix
    setinverse <- function(inverse) {
        cached_matrix <<- inverse
    }
    
    ## get inverse cached matrix
    getinverse <- function() {
        cached_matrix
    }
    
    ### return matrix
    list(set = set, 
         get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Write a short comment describing this function
### This function return cached inverted Matrix
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    ## get cache
    cached_matrix <- x$getinverse()
    
    ## if cache exists return this
    if(!is.null(cached_matrix)) {
        message("getting cached inverted matrix")
        return(cached_matrix)
    }
    
    ## make cache of invert matrix
    data <- x$get()
    inverse <- solve(data, ...)
    
    ## set cache for inverted matrix
    x$setinverse(inverse)
    
    ## return inverted matrix 
    return(inverse)
}

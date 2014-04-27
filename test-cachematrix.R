#!/usr/bin/R
#
# test script for cache matrix functions
#

source("cachematrix.R")

## create test matrix
size=5
testMatrix = matrix(rnorm(size^2), size, size)

cat("make inverted nonCachedMatrix for compare")
nonCachedMatrix = solve(testMatrix)
nonCachedMatrix

cat("make cached matrix")
cachedMatrix = makeCacheMatrix(testMatrix)

cat("get cache of inverted matrix")
cacheSolve(cachedMatrix)

cat("make cachedInvertedMatrix from cache of inverted matrix")
cachedInvertedMatrix = cacheSolve(cachedMatrix)
cachedInvertedMatrix

if ( all.equal(nonCachedMatrix, cachedInvertedMatrix) ) {
    cat("Non cached matrix and cached matrix are equal")
} else {
    message("Non cached matrix and cached matrix are not equal!")
}

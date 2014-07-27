## Matrix inversion is a costly computation and there may be some
## benefit to caching the inverse of a matrix rather than computing it
## repeatedly. The following two functions will take the advantage of
## the scoping rules of R language and how it can be used to store
## the state (the value of a calculation) inside of an R object.

## makeCacheMatrix: This function creates a special "matrix" object
## that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
}

## cacheSolve: This function computes the inverse of the special
## "matrix" returned by `makeCacheMatrix` above. If the inverse has
## already been calculated (and the matrix has not changed), then
## `cacheSolve` should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
}

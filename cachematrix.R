## Matrix inversion is a costly computation and there may be some
## benefit to caching the inverse of a matrix rather than computing it
## repeatedly. The following two functions will take the advantage of
## the scoping rules of R language and how it can be used to store
## the state (the value of a calculation) inside of an R object.

## makeCacheMatrix: This function creates a special "matrix" object
## that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
  # internal cache
  inv <- NULL
  
  # set new matrix, and null the cache
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  # get the matrix
  get <- function() {
    x
  }

  # set inverse matrix
  solveSet <- function(i) {
    inv <<- i
  }
  
  # get the inverse matrix
  solveGet <- function() {
    inv
  }
  
  # return the methods
  list(set = set, get = get, solveSet = solveSet, solveGet = solveGet)
}

## cacheSolve: This function computes the inverse of the special
## "matrix" returned by `makeCacheMatrix` above. If the inverse has
## already been calculated (and the matrix has not changed), then
## `cacheSolve` should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
  # get the value of inverse
  inv <- x$solveGet()
  
  # if it is not NULL - return it
  if(!is.null(inv)) {
    message("getting cached inverse matrix")
    return(inv)
  }
  
  # cache is not set - calculate the inversion
  m <- x$get()
  inv <- solve(m)

  # store calculated value in the object's cache  
  x$solveSet(inv)
  
  # return the inverse matrix
  inv
}

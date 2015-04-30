## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  # initialize the function scoped variables
  m <- NULL

  # set method for the input matrix
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  # get the input matrix
  get <- function() x
  
  #get & set methods for the inverse
  setInverse <- function (solve) m <<- solve
  getInverse <- function () m
  list (set = set, get = get, 
        setInverse = setInverse, getInverse = getInverse)
}

## cacheSolve wraps the base solve function in R
## in uses the matrix set in the makecaCacheMatrix function
cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  if (!is.null(m)) {
      message("Getting Cached Data")
      returun (m)
  }
  ## Inverse was not cached so calc & cache it
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}

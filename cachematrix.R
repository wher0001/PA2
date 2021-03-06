## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# The first function, makeVector creates a special "vector", which is really a list containing a function to
# set the value of the matrix
# get the value of the martix
# set the value of the inverse of the above matrix
# get the value of the inverse of the above matrix
makeCacheMatrix <- function(x = matrix()) {
  invrs <- NULL
  set <- function(y) {
    x <<- y
    invrs <<- NULL
  }
  get <- function() x
  setinvrs <- function(inverse) invrs <<- inverse
  
  getinvrs <- function() invrs
  list(set = set, get = get, setinvrs = setinvrs, getinvrs = getinvrs)
}


# Write a short comment describing this function

# The following function calculates the inverse of a matrix
# created with the above function. However, it first checks to see if
# the inverse has already been calculated. If so, it gets the inverse from
# the cache and skips the computation. Otherwise, it calculates the
# inverse of the matrix and sets the value of the inverse in the cache via
# the setinvrs function.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  invrs <- x$getinvrs()
  if(!is.null(invrs)) {
    message("getting cached data")
    return(invrs)
  }
  data <- x$get()
  invrs <- solve(data)
  x$setinvrs(invrs)
  invrs
}
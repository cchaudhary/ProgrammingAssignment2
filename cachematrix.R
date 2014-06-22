
## Following function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
     
  my_matrix <- NULL
  
  #Function to set the matrix
  set <- function(y) {
    x <<- y
    my_matrix <<- NULL
  }
  
  #Function to retrieve a matrix
  get <- function() x
  
  #Function to set the Inverse
  setInverse <- function(inverse) my_matrix<<- inverse
  
  #Function to retrieve the Inverse
  getInverse <- function() my_matrix
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)

  
    
}

#Following function computes the inverse of an invertible matrix.
#If the inverse has already been calculated (and the matrix has not changed), 
#then function shall retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  
  my_matrix <- x$getInverse()
  
  if(!is.null(my_matrix)) {
    
    message("This is cached data")
    return(my_matrix)
  }
  
  data <- x$get()  
  my_matrix <- solve(data)
  x$setInverse(my_matrix)
  ## Return a matrix that is the inverse of 'x'
  my_matrix      
  
}

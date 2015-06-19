## Put comments here that give an overall description of what your
## functions do

#The makeCacheMatrix function will create a matrix object that can cache 
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL 
  set <- function(y) {   
    x <<- y    
    m <<- NULL  
  }
  get <- function() x 
  setmatrixsol <- function(solve) m <<- solve  
  getmatrixsol <- function() m
  list(set = set, get = get,
       setmatrixsol = setmatrixsol,
       getmatrixsol = getmatrixsol)  
}



##If the function works correctly, you should be able to pass the special matrix 

cacheSolve <- function(x = matrix(), ...) {  #comparing matrix with previous one
  m <- x$getmatrixsol()  #this gets the inverse if it was already calculated
  if(!is.null(m)) {   
    message("getting cached data") 
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...) #computes the inverse of the matrix
  x$setmatrixsol(m) 
  m 
}
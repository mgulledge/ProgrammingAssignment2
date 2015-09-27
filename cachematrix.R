## Michael Gulledge
## GitHub: mgulledge

## Functionality to set and cache matrix information and inverse matrix information, if desired


## Create a cache for the matrix and set getters and setters 

makeCacheMatrix <- function(x = matrix()) {
  
  # Matrix object with getters, setters for matrix and inverse matrix 
  
  # Define the cache matrix
  c <- NULL
  
  # setter for matrix
  set <- function(y){
    
    # Set enviornment variable to the matrix passed through params 
    x <<- y
    # Set the cache to null since there's a new matrix
    c <<- NULL
  }
  
  # getter for matrix 
  get <- function(){
    # return the x matrix
    x
  }
  
  # setter for the inverse
  setInverse <- function(i){
    # set the cache to the inverse function
    c <<- i
  }
  
  #getter for the inverse 
  getInverse <- function(){
    #return the inverse function that's cached 
    c
  }
  
  list(set = set, get=get, setInverse = setInverse, getInverse = getInverse)
  

}


## Solve the inverse and set the inverse to the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  # call the getter for the inverse
  c <- x$getInverse()
  
  # if the cache is not null
  if(!is.null(c)){
    message("Cached data found...retrieving...")
    return(c)
  }
  
  # get matrix
  d <- x$get()
  
  # solve matrix
  c <- solve(d, ...)
  
  # set the inverse
  x$setInverse(c)
  c
}

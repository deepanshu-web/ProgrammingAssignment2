## Put comments here that give an overall description of what your
## functions do

## The function returns a list of functions.

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function() x
  setinverse<-function(solve) m<<-solve
  getinverse<-function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## The function uses list of functions from the above function to and checks if  the inverse already exists or not
##and then returns the inverse.

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
solve(a)
a<-matrix(8:11,nrow=2,ncol=2)
t<-makeCacheMatrix(a)
cacheSolve(t)

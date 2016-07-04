## caching the inverse of a matrix

## the following are a pairs of functions that are used to create a special object 
## that stores a matrix and caches its inverse. 

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) { 
  
              m <- NULL
              set <- function(y) {
                    x <<- y 
                    m <<- NULL
              }
              get <- function()x
              setMatrix <- function(solve)m <<- solve
              getMatrix <- function()m
              list(set = set, get = get, 
                   setMatrix = setMatrix, 
                   getMatrix = getMatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x = matrix(), ...) {
        ## Return a matrix that is the inverse of 'x'
  
              m <- x$getMatrix()
              if(!is.null(m)) {
                    message("getting chached data")
                    return(m)
              }
              
              mat <- x$get()
              m <- solve(mat, ...)
              x$setMatrix(m)
              m
  
}


rm(my_matrix)
##  testing 

my_mat <- makeCacheMatrix(matrix(1:4, 2, 2))
my_mat
my_mat$get()


my_mat$getMatrix()

cacheSolve(my_mat)

## repeating the above step once again to check if the cache worked and 
## to see if we can get the message printed out 

cacheSolve(my_mat)





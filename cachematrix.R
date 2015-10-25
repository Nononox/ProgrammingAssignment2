## R Programming Assignment 2
## by Ran Tao 2015/10/24

## The function makeCacheMatrix performs the set, get, setsolve and getsolve function in a list.

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL;
    set <- function(y) {
        x <<- y;
        m <<- NULL;
    };
    get <- function() x;
    setsolve <- function(solve) m <<- solve;
    getsolve <- function() m;
    list(set = set, get = get, setsolve = setsolve, getsolve = getsolve);
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getsolve()
    if(!is.null(m)) {
        message("getting cached data");
        return(m);
    };
    data <- x$get();
    m <- solve(data, ...);
    x$setsolve(m);
    m;
}

## For Test Use
# a <- makeCacheMatrix()
# ma <- matrix(1:16, 4, 4)
# a$set(ma)
# det(ma)
# cacheSolve(a)
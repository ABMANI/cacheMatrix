#In this example we introduce the <<- operator which can be used to assign a value to an object in an environment that is different from the current environment. Below are two functions that are used to create a special object that stores a numeric vector and cache's its mean.

#The first function, makeVector creates a special "vector", which is really a list containing a function to

#1. set the value of the vector
#2. get the value of the vector
#3. set the value of the mean
#4. get the value of the mean

#set the value of the matrix
makeCacheMatrix<-function(x=matrix()) {
  i<-NULL
set<-function(y){
  i<<-NULL
  x<<-y
}
get<-function()return(x)
setinv<-function(inv) i<<-inv
getinv<-function() return(i)
list(set=set,get=get,
     setinv=setinv,
     getinv=getinv)
}

#This function computes the inverse of the special matrix returned by 'makeCacheMatrix' above.
CacheMatrix<-function(x,...){
  i<-x$getinv()
  if(!is.null(i)){
    message("getting cached data")
    return(i)
  }
  data<-x$get()
  #x<-get()
  i<-solve(data,...)
  x$setinv(i)
  return(i)
}
  


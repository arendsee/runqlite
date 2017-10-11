#' @useDynLib unqlite
#' @importFrom Rcpp sourceCpp
NULL

#' @export
openDB <- function(filename){
  db <- c_openDB(filename) 
  ## TODO: once I get the linking working, I can use the code below to build
  ## the real db object
  # new('UnqliteConnection',
  #   dbptr = db[[1]],
  #   cursor = db[[2]]
  # )
  db
}

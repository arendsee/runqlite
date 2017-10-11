#' @useDynLib unqlite
#' @importFrom Rcpp sourceCpp
NULL

#' @export
openDB <- function(filename){
  c_openDB(filename) 
}

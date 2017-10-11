#' @useDynLib unqlite
#' @importFrom Rcpp sourceCpp
NULL


#' Open/create a new UnQLite database 
#'
#' An UnQLite database stores data in a local file. This function opens such a
#' database (or creates it, if no file is found). This file will persist across
#' sessions.
#'
#' @param filename UnQLite database filename
#' @return UnqliteConnection object
#' @export
unqlite_open <- function(filename){
  db <- c_openDB(filename) 
  ## TODO: once I get the linking working, I can use the code below to build
  ## the real db object
  # new('UnqliteConnection',
  #   dbptr = db[[1]],
  #   cursor = db[[2]]
  # )
  db
}

#' Close a database connection
#'
#' @param db UnqliteConnection object to be closed
#' @export
unqlite_close <- function(db){
  c_closeDB(db$dbptr)
}


#' Store a key/value pair
#'
#' @param key Any R object
#' @param value Any R object
#' @param db UnqliteConnection object
#' @export
unqlite_kv_store <- function(db, key, val){
  raw_key <- serialize(key, NULL)
  raw_val <- serialize(val, NULL)
  c_unqlite_kv_store(db$dbptr, raw_key, raw_val);
}


#' Delete an entry in the database
#'
#' @param key Any R object, if the key does not exist, nothing is done
#' @param db UnqliteConnection object
#' @export
unqlite_kv_delete <- function(db, key){
  raw_key <- serialize(key, NULL)
  c_unqlite_kv_delete(db$dbptr, raw_key);
}


#' Fetch an entry from a database
#'
#' @param key Any R object
#' @param db UnqliteConnection object
#' @export
unqlite_kv_fetch <- function(db, key){
  raw_key <- serialize(key, NULL)
  raw_val <- c_unqlite_kv_fetch(db$dbptr, raw_key);
  unserialize(raw_val)
}


# TODO: replace these stubs with C++ functions (for which R wrappers will be
# automatically generated)
c_closeDB           <- function(...){}
c_unqlite_kv_store  <- function(...){}
c_unqlite_kv_delete <- function(...){}
c_unqlite_kv_fetch  <- function(...){}

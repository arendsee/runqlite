#' UnQLite database object
#'
#' This class holds an external pointer to an UnQLite database and the current
#' cursor position. You should never need to do anything with its internal
#' values.
#'
#' @slot dbptr  External pointer to the UnQLite database
#' @slot cursor Cursor position
UnqliteConnection <- setClass(
  "UnqliteConnection",
  representation(
    dbptr  = "externalptr",
    cursor = "integer"
  )
)

# runqlite

Create and access unqlite databases.

## Installation

You can install unqlite from github with:

``` R
# install.packages("devtools")
devtools::install_github("arendsee/unqlite")
```

## Example

None of these actually work yet, since the C-side isn't implemented. These are
just examples of the current API.


```{r example}
library(unqlite)

# Create a new persistant database
db <- unqlite_open("test.db")

# Store a key/value pair. These may both be arbitrary R objects
unqlite_store(db, key="irises", value=iris)

# Pull an item from the database into memory
iris <- unqlite_fetch(db, key="irises")

# Delete an entry
unqlite_delete(db, key="irises")

# Close the database (the file "test.db" remains)
unqlite_close(db)
```

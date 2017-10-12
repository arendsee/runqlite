context("access")

test_that("unqlite_open", {
  expect_silent({
    unqlite_open("hi.db")
  })
})

test_that("unqlite_close", {
  expect_silent({
    db <- unqlite_open("hi.db")
    unqlite_close(db)
  })
})

test_that("unqlite_kv_store", {
  expect_silent({
    db <- unqlite_open("hi.db")
    unqlite_kv_store(db, "key", "value")
  })
})

test_that("unqlite_kv_fetch", {
  expect_equal(
    {
      db <- unqlite_open("hi.db")
      unqlite_kv_store(db, "key", "value")
      unqlite_kv_fetch(db, "key")
    },
    "value"  
  )
})

test_that("unqlite_kv_delete", {
  expect_equal(
    {
      db <- unqlite_open("hi.db")
      unqlite_kv_store(db, "key", "value")
      unqlite_kv_delete(db, "key")
      unqlite_kv_fetch(db, "key")
    },
    NULL  
  )
})

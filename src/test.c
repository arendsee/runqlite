#include <unqlite.h>
#include <stdio.h>

// [[Rcpp::export]]
Rcpp::List openDB(std::string dbfilename){

    unqlite *pDb;

    // Open our database;
    int rc = unqlite_open(&pDb, dbfilename, UNQLITE_OPEN_CREATE);
    if( rc != UNQLITE_OK ){
        return;
    }

    Rcpp::XPtr<unqlite*> db = p(pDb, true);

    List out(2);

    out[1] = db;
    out[2] = rc;

    return out;

}

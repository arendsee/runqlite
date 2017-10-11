extern "C" {
#include <unqlite.h>
}
#include <stdio.h>
#include <Rcpp.h>

// [[Rcpp::export]]
Rcpp::List c_openDB(std::string dbfilename){

    unqlite *pDb;

    // Open our database;
    int rc = unqlite_open(&pDb, dbfilename.c_str(), UNQLITE_OPEN_CREATE);
    if( rc != UNQLITE_OK ){
        Rcpp::stop("Failed to open database");
    }

    Rcpp::XPtr<unqlite> db(pDb);

    Rcpp::List out(2);

    out[0] = db;
    out[1] = Rcpp::NumericVector::create(rc);

    return out;

}


// c_closeDB
// c_unqlite_kv_store
// c_unqlite_kv_delete
// c_unqlite_kv_fetch

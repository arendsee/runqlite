// #include <unqlite.h>
#include <Rcpp.h>

// [[Rcpp::export]]
Rcpp::List c_openDB(std::string dbfilename){

    // unqlite *pDb;
    //
    // // Open our database;
    // int rc = unqlite_open(&pDb, dbfilename, UNQLITE_OPEN_CREATE);
    // if( rc != UNQLITE_OK ){
    //     return;
    // }
    //
    // Rcpp::XPtr<unqlite*> db = p(pDb, true);
    //
    // List out(2);
    //
    // out[1] = db;
    // out[2] = rc;

    Rcpp::List out(2);

    out[0] = Rcpp::CharacterVector::create("foo");
    out[1] = Rcpp::NumericVector::create(1,2);

    return out;

}

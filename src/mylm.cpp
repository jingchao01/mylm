#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericMatrix cpp_matrix_multiply(NumericMatrix A, NumericMatrix B) {
  int n = A.nrow();
  int m = B.ncol();
  NumericMatrix result(n, m);

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      for (int k = 0; k < A.ncol(); k++) {
        result(i, j) += A(i, k) * B(k, j);
      }
    }
  }
  return result;
}


// [[Rcpp::export]]
NumericMatrix cpp_matrix_transpose(NumericMatrix A) {
  int n = A.nrow();
  int m = A.ncol();
  NumericMatrix result(m, n);

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < m; j++) {
      result(j, i) = A(i, j);
    }
  }
  return result;
}






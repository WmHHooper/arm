// CSC 2110, Computer Organization
// Tutorial 9: Floating-Point Instructions
// by William H. Hooper

// Computes the dot product of vectors X and Y,
// of length N.

double DotProd(double X[], double Y[], int N) {
  double sum = 0;
  int i;
  for(i = 0; i < N; i++) {
    sum += X[i] * Y[i];
  }
  return sum;
}

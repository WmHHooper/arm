// CSC 2110, Computer Organization
// Tutorial A: Floating Point Formats
// by William H. Hooper

// This program reads numbers in double-precision,
// and converts them to single-precision.

#include <iostream>
#include <iomanip>
using namespace std;

extern "C" void DoubleToSingle(double * D, float * F);

int main() {
  double  D;
  float  F;
  
  cout << "Convert Double- to Single-Precision." << endl
  << "Please enter a number, 'q' to quit:" << endl
  << "> ";

  while(cin >> D) {
    DoubleToSingle(&D, &F);
    cout << setprecision(9)
    << D << "(D) = " << F << "(F)" << endl
    << "> ";
  }
  return 0;
}

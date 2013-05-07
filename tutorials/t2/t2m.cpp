// CSC 2110, Computer Organization
// Tutorial 2: Loops and branches.
// by William H. Hooper

// This program reads pairs of integers, 
// then raises the first to the power of the second
// and returns the integer result.

#include <iostream>
using namespace std;

extern "C" int exponent(int a, int b);

int main(){
  int n, x, f;

  cout << "Raise X to the Nth power." << endl 
  << "Please enter integers, 'q' to quit." << endl 
  << endl
  << "X N> ";

  while (cin >> x >> n) {
    f = exponent(x, n);
    cout << x << " ^ " << n << " = " << f << endl 
    << "X N> ";
  }
  return 0;
}

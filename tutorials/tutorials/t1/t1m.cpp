// CSC 2110, Computer Organization
// Tutorial 1: Introduction to Assembly
// by William H. Hooper

// This program reads Fahrenheit tempreatures
// and converts them to Centigrade.

#include <iostream>
using namespace std;

extern "C" int ftoc(int);

int main()
{
  int f,c;
  cout << "Convert temperatures, F to C" << endl 
  << "Please enter integers, 'q' to quit." << endl 
  << endl
  << "F> ";
  while(cin >> f) {
    c = ftoc(f);
    cout << f << " F = " 
    << c << " C" << endl
    << "F> ";
  }
  return 0;
}

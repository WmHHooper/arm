// CSC 2110, Computer Organization
// Tutorial 0: The Raspberry Pi
// by William H. Hooper

// This program reads values N, 
// computes the Nth Fibonacci numbers,
// and measures the time required.

#include <iostream>
#include <iomanip>
#include <ctime>
using namespace std;

extern "C" int Fib(int i);

int main()
{
  int n, f;
  timespec start, finish;
  double elapsed;

  cout << "Fibonacci calculator, F(n)" << endl 
  << "Please enter whole numbers, 'q' to quit." << endl 
  << endl
  << "n> ";

  while (cin >> n) {
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
    f = fib(n);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &finish);
    elapsed = (finish.tv_sec - start.tv_sec) 
      + (finish.tv_nsec - start.tv_nsec) * 1e-9;

    cout << "Fib(" << n << ") = "
    << f << " computed in "
    << elapsed << " seconds " << endl
    << "n> ";
  }
  return 0;
}

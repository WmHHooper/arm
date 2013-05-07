// CSC 2110, Computer Organization
// Tutorial B: Exception Handling 2
// by William H. Hooper

// This program reads numbers x and y,
// then computes sqrt(x/y).
// A handler intercepts the exceptions
// due to bad values of x and y.

#include <cmath>
#include <csignal>
#include <cstring>
#include <fpu_control.h>
#include <iostream>
using namespace std;

extern "C" void oops(int sig);
int last_signal = 0;
int count = 0;
fpu_control_t new_cw;

int main()
{
  double x, y, r;

  fpu_control_t old_cw;
  _FPU_GETCW(old_cw);
  old_cw |= _FPU_MASK_ZM | _FPU_MASK_IM;

  struct sigaction new_action;
  new_action.sa_handler = oops;
  sigemptyset (&new_action.sa_mask);
  new_action.sa_flags = 0;         
  sigaction (SIGFPE, &new_action, NULL);

  cout << "Compute sqrt(x/y)." << endl
  << "Enter floating-point x and y values, 'q' to quit." << endl
  << "x y> ";

  while (cin >> x >> y) {
    new_cw = old_cw;
    _FPU_SETCW(old_cw);
    last_signal = 0;

    r = sqrt(x / y);

    cout << "sqrt(" << x 
    << "/" << y 
    << ") = " << r << endl
    << "status: " << last_signal 
    << " (" << strerror(last_signal) << ")" << endl
    << "count: " << count << endl
    << "cw: 0x" << hex << new_cw << endl
    << "x y> ";
  }
  return 0;
} 

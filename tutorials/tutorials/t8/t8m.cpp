// CSC 2110, Computer Organization
// Tutorial 8: Exception Handling 1
// by William H. Hooper

// This program declares an array, prompts for indices,
// and prints the values indexed.
// If a a very large, incorrect index is given,
// a handler intercepts the segment fault,
// causing the program to print -1 and resume.

#include <csignal>
#include <cstring>
#include <iostream>
using namespace std;

extern "C" void bouncer(int sig);
int A[] = { 2, 3, 5, 7, 11, 13, 17, 23, 27, 31, 37 };
int last_signal = 0;
int count = 0;

int main()
{
  int i, v;
  struct sigaction new_action;
  
  new_action.sa_handler = bouncer;
  sigemptyset (&new_action.sa_mask);
  new_action.sa_flags = 0;         
  sigaction (SIGSEGV, &new_action, NULL);

  cout << "Examine an array." << endl
  << "Enter an index, 'q' to quit." << endl
  << "> ";

  while (cin >> i) {
    last_signal = 0;
    v = A[i];
    cout << dec
      << "A[" << i << "] = " << v << endl
      << "status: " << strsignal(last_signal) << endl
      << "count: " << count << endl
      << "> ";
  }
  return 0;
} 

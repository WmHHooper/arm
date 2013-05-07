// CSC 2110, Computer Organization
// Tutorial 9: Floating-Point Instructions
// by William H. Hooper

// Reads two vectors and computes their dot product.
// This main program is designed to link with several 
// versions of the C function, and to read from 
// the terminal or a file with equal ease.

#include <cstdlib>
#include <unistd.h>
#include <sys/time.h>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <cctype>
using namespace std;

extern "C" double DotProd(double X[], double Y[], int N);
char* baseName(char* path);
void readVectors(double* &X, double* &Y, int &N);
ostream* getPrompt();
  
int main(int argc, char* argv[]) {
  char* program = baseName(argv[0]);
  
  double *First, *Second;
  int length;
  readVectors(First, Second, length);
  
  timespec start, finish;
  clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start);
  double estimate = DotProd(First, Second, length);
  clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &finish);
  
  double elapsed = (finish.tv_sec - start.tv_sec) 
    + (finish.tv_nsec - start.tv_nsec) * 1e-9;
  
  cout << fixed << setprecision(6)
  << estimate << " computed by "
  << program << " in " 
  << elapsed << " seconds." << endl;
  return 0;
}

char* baseName(char* path) {
  char* name = path;
  char* p;
  
  for(p = path; *p; p++) {
    if(*p == '/') {
      name = p + 1;
    }
  }
  return name;
}

void readVectors(double* &X, double* &Y, int &N) {
  ostream &prompt = *getPrompt(); 
  prompt << "Compute the dot product of two vectors." << endl 
  << endl;
  prompt << "Please enter the length of the vectors: ";
  cin >> N;
  
  int A = (4 -(N % 4)) % 4;
  int M = N + A;
  
  X = new double[M];
  Y = new double[M];
  
  int i = 0;
  for (; i < N; i++) {
    prompt << "x[" << i << "]: ";
    cin >> X[i];
    prompt << "y[" << i << "]: ";
    cin >> Y[i];
  }
  for (; i < M; i++) {
    X[i] = Y[i] = 0.0;
  }
}

ostream* getPrompt() {
  if (isatty(0))
    return &cout;
    
  static ofstream bitbucket("/dev/null");
  return &bitbucket;
}

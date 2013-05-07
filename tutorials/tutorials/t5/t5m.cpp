// CSC 2110, Computer Organization
// Tutorial 5: Shift Operations
// by William H. Hooper

// This program prompts for octal numbers
// and prints the corresponding decimal numbers.

#include <cstdlib>
#include <iostream>
#include <iomanip>
#include <cctype>
using namespace std;

extern "C" int OctToInt(char *S);

int main() {
  int i;
  char buf[256];
	
  cout << "Octal -> Decimal Conversion." << endl
  << "Please enter octal strings, [0-7]*." << endl
  << "Enter an empty line to quit." << endl 
  << endl;

  do {
    cout << "> ";
    cin.getline(buf, 256);

    i = OctToInt(buf);
		
    cout << buf << "(8) = " << i << "(10)" << endl;		
  } while (i != 0);

  cout << "Done." << endl;
  return 0;
}

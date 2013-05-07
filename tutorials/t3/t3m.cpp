// CSC 2110, Computer Organization
// Tutorial 3: Addressing Modes I
// by William H. Hooper

// This program reads strings
// and converts them to lower case.

#include <iostream>
using namespace std;

extern "C" void NoCaps(char s[]);

int main(){
  char s[256] = "";
  
  cout << "Lower Case Conversion." << endl
  << "Please enter capitalized words," << endl
  << "Enter an empty line to quit." << endl;
  do {
    cout << "> ";
    cin.getline(s,256);
    cout << "  '" << s << "' -> ";

    NoCaps(s);
    
    cout << "'" << s << "'" << endl;
    
  } while (*s != 0);
  return 0;
}

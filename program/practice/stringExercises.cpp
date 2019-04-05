#include <iostream>
#include <cstring>

using namespace std;

int main() {
  char initialString[] = "This is a string.";
  char finalString[16] = "";
  char current;

  for(int i=16; i>=-1; current = initialString[i--]) {
    finalString << current;
  }

  cout << finalString;

  return 0;
}

#include <iostream>

using namespace std;

int test;

int main(){

  cout << "tell me a number\n";
  cin >> test;
  switch(test%2){
    case 0:
      cout << "the number is even.";
    break;
    case 1:
      cout << " the number is odd.";
    break;
  }
  return 0;
}

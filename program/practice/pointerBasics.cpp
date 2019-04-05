#include <iostream>
using namespace std;

int main() {
  long arr [] = {6, 0, 9, 6};
  long * ptr = arr;
  ptr ++;
  long *ptr2 = arr + 3;

  cout << *ptr << endl << *ptr2 << endl << arr[2] << endl;
  for(int i=0; i<4; i++){
    cout << arr[i] << endl;
  }

  return 0;
}

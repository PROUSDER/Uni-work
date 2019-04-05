#include <iostream>
using namespace std;

int main() {

  int dataValues[4];
  int * ptrMaxValue = dataValues;

  cout << "enter 4 integers." << endl;
  for(int i=0; i<4; i++){
    cin >> dataValues[i];
  }
  cout << endl;
  for(int i=0; i<4; i++){
    if(*ptrMaxValue < dataValues[i]){
      ptrMaxValue = dataValues + i;
    }
    cout << *ptrMaxValue << endl;
  }

  return 0;
}

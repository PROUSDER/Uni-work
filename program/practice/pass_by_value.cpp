#include <iostream>

using namespace std;

void increment(int &a) {
  a = a + 1;
  cout << "a in increment " << a << endl;

}

int main() {
    int q = 3;
    increment(q);
    cout << "q in main " << q << endl;

    return 0;
}

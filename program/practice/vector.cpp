#include <iostream>

#include "vector.h"
using namespace std;
// vector.cpp - method implementation

void Point::offset(double offsetX, double offsetY) {
  x += offsetX; y += offsetY;
}

void Point::print() {
  cout << "(" << x << "," << y << ")";
}

void Vector::offset(double offsetX, double offsetY) {
  start.offset(offsetX, offsetY);
  end.offset(offsetX, offsetY);
}

void Vector::print() {//:: indicates which class' method is being implemented.
start.print();
cout << " -> ";
end.print();
cout << endl;
}

int main() {

  Vector vec;
  vec.start.x = 1.2; vec.end.x = 2.0;
  vec.start.y = 0.4; vec.end.y = 1.6;
  vec.print(); // method
  vec.offset(1.0, 1.5); // arguments can be passed to methods.

  return 0;
}

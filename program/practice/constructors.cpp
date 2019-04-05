#include <iostream>


class Point {
public:
  double x, y;
  Point(double nx, double ny) {
    x = nx; y = ny; std::cout << "Point instance created" << std::endl;
  }
};

int main() {
  Point q(2.0, 3.0); // Point instance created
  Point r = q;
  std::cout << r.x << std::endl; // p.x is 0.0, p.y is 0.0
}

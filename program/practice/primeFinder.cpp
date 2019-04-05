#include <stdio.h>
#include <vector>


bool PrimeTest(int testInt, std::vector<int> &primes) {

  for(std::vector<int>::iterator it = primes.begin(); it != primes.end(); ++it) {
    if((testInt % *it) == 0 ) {
      return false;
      break;
    }
  }
  primes.push_back(testInt);
  return true;
}

int main() {

  std::vector<int> primes = {};

   for(int i=2; i<1001; i++) {
    if(PrimeTest(i, primes)) {printf("%d is prime.\n", i);}
  }

  return 0;
}

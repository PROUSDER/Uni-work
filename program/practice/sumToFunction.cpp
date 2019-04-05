#include <stdio.h>

using namespace std;


int sumTo(int targetValue) {

  int sumToTarget = 0;

  for(int i = 0; i < (targetValue + 1); i++) {
    sumToTarget +=i;
  }
  return sumToTarget;
}


int main() {

  int target, sumToReturn;

  printf("give a target integer to sum to.\n");
  scanf("%d", &target);
  printf("you gave %d\n", target);
  
  sumToReturn = sumTo(target);
  printf("the sum of the natural numbers up to %d, is %d.", target, sumToReturn);
  return 0;
}

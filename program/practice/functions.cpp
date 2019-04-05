#include <stdio.h>
#include <iostream>
using namespace std;

int max_two(int first, int second){
  if(first < second){return second;}
  if(second < first){return first;}
  if(second == first) {return 0;}
}

int main(){
  int firstNumber, secondNumber;

  printf("give two numbers\n");

  cin >> firstNumber >> secondNumber;

  printf("\n%d, %d\n", firstNumber, secondNumber);
  printf("%d is the greater value, (or they are equal if 0)." ,max_two(firstNumber, secondNumber));

}

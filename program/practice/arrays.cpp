#include <stdio.h>

main() {
  int chosenValues[10];
  int testValue;
  int occurances = 0;

  printf("input integers\n");
  for (int i=0; i < 10; i++){
    printf("integer %d\n", i+1);
    scanf("%d", &chosenValues[i]);
  }

  printf("you gave integers:\n");
  printf("%d", chosenValues[0]);
  for (int i=1; i<10; i++){
  printf(",%d", chosenValues[i]);
  }

  printf("\ngive an integer to test\n");
  scanf("%d", &testValue);

  for(int i=0; i<10; i++){
    if(chosenValues[i] == testValue){occurances++;}
  }
  printf("%d occurs %d times.", testValue, occurances);

  return 0;
}

#include <time.h>
#include <stdio.h>


int main() {
  clock_t t;
  int meditationTime;

  printf("how many minutes will you meditate?   \n");
  scanf("%d",&meditationTime);

  t = clock(); //record start time here
  meditationTime = meditationTime * CLOCKS_PER_SEC * 60;
  //calculates the number of cycles needed until required time is elapsed
  printf("start meditating.. \n");

  while(clock() - t < meditationTime){}
  //waits till required time has passed

  printf("how was your sit. ");
  for(int i; i < 2; i++ ){printf(" \a");}

return 0;
}

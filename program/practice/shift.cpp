#include <stdio.h>


int main() {

  int index = 0;
  int valueToAdd = 0;
  int newarr[7];

  int arr[6] = {1, 2, 3, 4, 5, 6};

  printf("give any integer, and a index from 0 to 5.\n");

  scanf("%d", &valueToAdd);
  scanf("%d", &index);

  for(int i = 0; i < 7; i++){
    if(i < index){
      newarr[i] = arr[i];
    }
    if(i > index){
      newarr[i] = arr[i-1];
    }
  }
  newarr[index] = valueToAdd;

  printf("{");
  for(int i = 0; i < 7; i++){
    printf(" %d",newarr[i]);
  }
  printf(" }");
  return 0;
}

#include <stdio.h>

int main() {
  char AString[] = "A string";
  char * ptrStr = AString;

  printf("first character is %c, the pointer position is %x t\n", *ptrStr, ptrStr);

  ptrStr = ptrStr + 2;
  printf("%c,%c,%c\n",*ptrStr,*(ptrStr + 2), *(ptrStr + 5));
}

#include <stdio.h>
#include <csignal>
#include <iostream>
using namespace std;

void signalHandler( int signum) {
  printf("\nInterrupt signal %d recieved", signum);

  exit(signum);
}




int main(){

  signal(SIGINT, signalHandler);

  while(1){
  printf("Hello World!");
  }



  return 0;
}

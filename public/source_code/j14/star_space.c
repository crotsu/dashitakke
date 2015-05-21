#include <stdio.h>

void star_space (int num)
{
  int i;

  i = 0;
  while (i<num-1) {
    printf(" ");
    i++;
  }
  printf("*\n");
}

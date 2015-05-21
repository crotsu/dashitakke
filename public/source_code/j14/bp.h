#include <stdio.h>
#include <stdlib.h>

#define PLAYER 5 
#define NAME 8+1

struct parameter {
  char name[NAME];
  int hp;
  int mp;
  double attack;
  double defence;
  double speed;
  double intelligence;
};

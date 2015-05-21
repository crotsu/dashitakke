#include <stdio.h>

int main(void)
{
  int h,m,s;
  int all_second;

  h = -1;
  while (h<0 || 24<=h) {
    printf("hour=");
    scanf("%d", &h);
  }

  m = -1;
  while (m<0 || 60<m) {
    printf("minute=");
    scanf("%d", &m);
  }

  while (s<0 || 60<s) {
    printf("second=");
    scanf("%d", &s);
  }

  all_second = h*60*60 + m*60 + s;
  printf("\n");
  printf("all_second=%d\n", all_second);
  printf("\n");

  return 0;
}

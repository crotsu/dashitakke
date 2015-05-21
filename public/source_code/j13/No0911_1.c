#include <stdio.h>

int main(void)
{
  char str[] = "What time is it now?";
  //char str[] = "What day is today?";
  int i;
  int length;
  int word_count;
  int word_begin;
  int word_end;

  printf("%s\n", str);

  /* (1) 文字列の長さ */
  i = 0;
  while(str[i] != '\0') {
    i++;
  }
  length = i;
  printf("(1) %d\n", length);

  /* (2) 空白の位置 */
  printf("(2) ");
  i = 0;
  while(str[i] != '\0') {
    if (str[i] == ' ') {
      printf("%d ", i+1);
    }
    i++;
  }
  printf("\n");

  /* (3) 単語の数 */
  word_count = 0;
  i = 0;
  while(str[i] != '\0') {
    if (str[i] == ' ') {
      word_count++;
    }
    i++;
  }
  word_count++;
  printf("(3) %d\n", word_count);

  /* (4) 文字列を逆順に出力 */
  printf("(4) ");
  i = length - 1;
  while(i>=0) {
    printf("%c", str[i]);
    i--;
  }
  printf("\n");

  // "What time is it now?\0";
  /* (5)  */
  printf("(5) ");
  word_begin = 0;
  for (i=0; i<=length; i++) {
    if (str[i] == ' ' || str[i] == '\0') {
      word_end = i-1;
      while(word_end>=word_begin) {
	printf("%c", str[word_end]);
	word_end--;
      }
      printf(" ");
      word_begin = i+1;
    }
  }
  printf("\n");

  return 0;
}

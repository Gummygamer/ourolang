#include "heading.h"

int yyparse();
extern FILE *yyin;

int main(int argc, char **argv)
{
  FILE *myfile = fopen(argv[1], "r");

  yyin = myfile;
  
  yyparse();

  return 0;
}

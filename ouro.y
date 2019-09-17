%{
#include "heading.h"

extern int yylex();
extern int yyparse();
extern FILE *yyin;

int yyerror(char *s);

char* output;

%}

%union{
	int int_val;
	char* op_val;
	char* str_val;
}

%start input

%token <int_val> NUMBER
%token <str_val> STRING
%left FUNC
%token END
%token BREAK

%%

input: lines
       ;

lines: lines line | line
       ;

line:  call BREAK
       ;

call:	FUNC NUMBER { printf("%d\n",$2); }
	| FUNC STRING { $2[strlen($2) - 1] = 0; $2++; printf("%s\n",$2);}
	;
%%

int yyerror(char* s)
{
  extern int yylineno;	
  extern char *yytext;

  if(!strcmp(yytext,"end"))
  {
	exit(0);
  }
  else
  {
  	printf("ERROR: ");
  	printf("%s",s);
  	printf(" at symbol ");
  	printf("%s",yytext);
  	printf(" on line");
  	printf("%d\n", yylineno);
  	printf("\n");

  	exit(1);
   }
}

int main(int argc, char **argv)
{
  FILE *myfile = fopen(argv[1], "r");

  yyin = myfile;
  
  yyparse();

  return 0;
}


%{
#include "heading.h"
#include "ouro.tab.h"

int yyerror(char* s);

%}

number	[0-9]+
string	\"(\\.|[^"\\])*\"
operand {number}|{string}
function show

%%
{number} {yylval.int_val = atoi(yytext); return NUMBER;}
{function} {yylval.op_val = yytext; return FUNC; }
{string} {yylval.str_val = yytext; return STRING; }

[\n] { yylineno++; return BREAK;}


%%

 
	


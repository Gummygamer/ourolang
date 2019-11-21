%{
#include "heading.h"
#include "ouro.tab.h"

int yyerror(char* s);

%}

type	number|word
number	[0-9]+
string	\"(\\.|[^"\\])*\"
identifier [a-z]+
operand {number}|{string}|{identifier}
function show


%%
{type} {yylval.strval = yytext; return TYPE; }
{number} {yylval.int_val = atoi(yytext); return NUMBER;}
{function} {yylval.op_val = yytext; return FUNC; }
{identifier} {yylval.strval = yytext; return IDENTIFIER; }
{string} {yylval.str_val = yytext; return STRING; }
[+] {return PLUS;}
[-] {return MINUS;}
[*] {return MULT;}
[/] {return DIV;}

[\n] { yylineno++; return BREAK;}



%%

 
	


# Makefile

ouro:
	bison -d ouro.y
	flex ouro.lex
	gcc ouro.tab.c lex.yy.c -lfl -o ouro

clean:
	rm -f *.o *~ lex.c lex.yy.c bison.c tok.h ouro.tab.c ouro.tab.h ouro.output ouro

%{
  #include <stdio.h>
  #include "asm.h"

  int yylex();
  int yyerror(char *s);

  int numErrors=0;
%}

%token TK_INT TK_REAL TK_ID

%%

inicio: /* vazio */
	| inicio expressao '\n'
	| inicio '\n'
	| inicio error '\n'
	;


expressao: TK_ID '=' expr
	| expr
	;

expr: valor
	|expr '+' expr
	|expr '-' expr
	|expr '/' expr
	|expr '*' expr
	|expr '+' expr
	|'('expr')'
	'-'expr
	;

valor:	  TK_INT
	| TK_REAL
	| TK_CHAR
	;

%%

int main()
{
	yyparse();
}

int yyerror(char *s)
{
	numErrors++;
	printf("erro sintatico/semantico : %s\n", s);
	return numErrors;
}

%{
  #include <stdio.h>
  #include <stdlib.h>
  #include "asm.h"

  int yylex();
  int yyerror(char *s);

  void compara(TValor v1, int op, TValor v2);

  int numErrors=0;
%}

%union { TValor val; }

%token <val> TK_INT TK_CHAR
%token MENOR_IGUAL MAIOR_IGUAL DIFERENTE
%type <val> valor expressao

%%

inicio: /* vazio */
	| inicio expressao '\n'
	| inicio '\n'
	| inicio error '\n'
	;


expressao: valor {$$ = $1;}
	| expressao '<' valor		{ compara($1, '<', $3);  $$ = $3;}
	| expressao '>' valor		{ compara($1, '>', $3);  $$ = $3;}
	| expressao '=' valor		{ compara($1, '=', $3);  $$ = $3;}
	| expressao MENOR_IGUAL valor	{ compara($1, MENOR_IGUAL, $3);  $$ = $3;}
	| expressao MAIOR_IGUAL valor	{ compara($1, MAIOR_IGUAL, $3);  $$ = $3;}
	| expressao DIFERENTE valor	{ compara($1, DIFERENTE,   $3);  $$ = $3;}
	;


valor:	  TK_INT   {$$ = $1;}
	| TK_CHAR  {$$ = $1;}
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


void compara(TValor v1, int op, TValor v2)
{
	if (v1.t != v2.t) {
		puts("Incompatível");
		return;
	}

	switch (op) {
		case '<' : puts(v1.valor<v2.valor?"Verdadeiro":"Falso");
			   break;
		case '>' : puts(v1.valor>v2.valor?"Verdadeiro":"Falso");
			   break;
		case '=' : puts(v1.valor<v2.valor?"Verdadeiro":"Falso");
			   break;
		case MENOR_IGUAL : puts(v1.valor<=v2.valor?"Verdadeiro":"Falso");
			   break;
		case MAIOR_IGUAL : puts(v1.valor>=v2.valor?"Verdadeiro":"Falso");
			   break;
		case DIFERENTE : puts(v1.valor!=v2.valor?"Verdadeiro":"Falso");
			   break;
		default: break;
	}
}

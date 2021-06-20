%{
    #include <stdio.h>
    #include <stdlib.h>

      int yylex();
      int yyerror(char *s);

    int numErros=0;
    double var_ids[26];
%}

%union {
  char  id;
  int   inteiro;
  double real;
}

%token <id>      ID 
%token <inteiro> INT 
%token <real>    REAL
%left '+' '-'
%left '*' '/'

%type <real>    valor expr

%start expressoes

%%

expressoes:	  /* vazio */
		| expressoes formula ';'
        | expressoes ';'
        | expressoes error ';' {yyerror("expressao invalida!");}
        ;

formula:  ID '=' expr	{ var_ids[$1 - 'a'] = $3; printf( "%c : %lf\n", $1, $3); }
	| expr		{ printf( "%lf\n", $1); }
    ;


expr:	  expr '+' expr	{ $$ = $1 + $3; }
	| expr '-' expr	{ $$ = $1 - $3; }
	| expr '*' expr	{ $$ = $1 * $3; }
	| expr '/' expr	{ $$ = $1 / $3; }
	| '-' expr	{ $$ = - $2; }
	| '(' expr ')'	{ $$ = $2; }
	| valor		{ $$ = $1; }
	;

valor:	  ID      	{ $$ = var_ids[$1 - 'a']; }
        | INT     	{ $$ = $1; }
        | REAL    	{ $$ = $1; }
        ;

%%

int main()
{
	yyparse();

	if(numErros==0)
		printf("Frase v�lida\n");
	else
		printf("Frase inválida\nN�mero de erros: %d\n",numErros);
	
	return 0;
}


int yyerror(char *s)
{
	numErros++;
	printf("erro sintatico/semantico: %s\n",s);
}



%{
#include <stdio.h>
	int yylex();
        int yyerror(char *s);
%}

%union {
	double valor;
}


%token <valor> TK_PRODUTO TK_MOEDA
%type <valor> produto moedas

%%

inicio :	  /* vazio */  
		| inicio produto '\n'
		| inicio error 
		;
	
produto :	  TK_PRODUTO ',' moedas	{ printf("Troco = %f\n", $3 - $1); }
		;
	
moedas :	  TK_MOEDA	        { printf("%f\n", $1); $$ = $1; }
		| moedas ',' TK_MOEDA	{ $$ = $1 + $3;  printf("%f\n", $3); }
                ;
	
%% 

int yyerror(char *s) 
{ 
  printf("Erro sintáctico: %s\n",s); 
  return 0;
} 


int main() 
{ 
  yyparse(); 
}



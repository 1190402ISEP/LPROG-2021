
%{
 #include <stdio.h>
 int yylex();
 int yyerror (char *);
 
 int numArgs=0, numErros=0;
%}

%token ID INT REAL
%start inicio

%%

inicio:	/*vazio*/
	| lista_args
	;
lista_args: arg
	| lista_args ',' arg
	;
	
arg:	ID	{numArgs++;}
	| INT {numArgs++;}
	| REAL {numArgs++;}
	;

%%

int main () {
	yyparse () ;

	if (numErros==0)
		printf("Frase válida \n") ;
	else
		printf ("Frase inválida \nNúmero de erros : %d\n" ,numErros) ;

	printf ("Número de argumentos é %d\n",numArgs) ;

	return 0;
}

int yyerror (char *s) {
	numErros++;
	printf("erro sintactico/semantico:%s\n",s) ;
}


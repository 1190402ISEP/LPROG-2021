%{
    #include <stdio.h>
    #include <stdlib.h>
    int numErrors = 0;
    int yylex();
    int yyerror(char *s);

%}

%token INT MENOR_IGUAL MAIOR_IGUAL DIFERENTE

%%

inicio: /*vazio*/
	|inicio comparacao '\n'
	|inicio '\n'
	|inicio error '\n'
	;

comparacao:	INT '<' INT {if($1<$3) puts ("VERDADEIRO");else puts("FALSO");}
	|	INT '>' INT {if($1>$3) puts ("VERDADEIRO");else puts("FALSO");}
	|	INT '=' INT {if($1==$3) puts ("VERDADEIRO");else puts("FALSO");}
	|	INT MENOR_IGUAL INT {if($1<=$3) puts ("VERDADEIRO");else puts("FALSO");}
	|	INT MAIOR_IGUAL INT {if($1>=$3) puts ("VERDADEIRO");else puts("FALSO");}
	|	INT DIFERENTE INT {if($1!=$3) puts ("VERDADEIRO");else puts("FALSO");}
	;

%%

int main()
{
    yyparse();
    return 0;
}

int yyerror(char *s)
{
    numErrors++;
    printf("erro sintatico/semantico: %s\n", s);
    return numErrors;
}
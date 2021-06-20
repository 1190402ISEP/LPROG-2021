%{
    #include <stdio.h>
    int numErrors = 0;
    int yyerror(char *s);
%}



%token TK_HELLO TK_WORLD TK_WORD
%start phrase

%%
phrase  :        /*vazio*/
        | words TK_WORLD
        | phrase TK_HELLO
        | phrase TK_WORD
        ;
words   : phraser TK_HELLO{printf("Hello World\n");}
		| words TK_WORLD
		| phrase TK_WORD
		;
%%

int main()
{
    yyparse();
}

int yyerror(char *s)
{
    numErrors++;
    printf("erro sintatico/semantico: %s\n", s);
}
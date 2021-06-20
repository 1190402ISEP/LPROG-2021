
%{
	#include <stdio.h>
	#include <string.h>

        int max_alunos = 0;
        char max_esc[5];
        
        int yylex();
        int yyerror(char *s);
%}

%union {
   int num;
   char *str;
}



%token <str> TK_ESCOLA TK_STRING
%token <num> TK_NUM



%% 

inicio :  /* vazio */  
	| inicio cabecalho '\n' lista_docentes '\n'
        | inicio '\n'
        | inicio error '\n' {yyerror("escola/docente invalido");}
	;

cabecalho :     TK_ESCOLA TK_NUM TK_STRING  {
                      if ($2 < 101) 
                         yyerror("Numero de alunos invalido");
                      else {
                         if ($2>max_alunos) {
                             max_alunos = $2;
                             strcpy(max_esc, $1);  free($1);
                         }
                      }
                   }
                ;

lista_docentes :   docente
                | lista_docentes '\n' docente
                ;

docente :       TK_STRING TK_NUM TK_STRING {
                        if ($2 < 1000)
                           yyerror("Numero de extensão invalido");
                        else
                           if (strcmp($3, "DEI")==0)
                              printf("Nome : %s - Extensao : %d\n", $1, $2);
                        free($1);  free($3);
                }
                               
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
   printf("Escola com mais alunos - %s com %d alunos\n", max_esc, max_alunos);
}


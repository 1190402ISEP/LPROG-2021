%{
	#include "aula_pl.tab.h" /* header gerado pelo bison */
	extern int numErros ; /* variável criada no bison */
%}

%%
,				return yytext[0] ;
[0-9]+				return INT;
[0-9]+\.[0-9]+			return REAL;
[_a-zA-Z ][_a-zA-Z0-9]*		return ID;
[ \t]		/* ignorado */
.		{
			printf ( "Erro lexico : simbolo desconhecido %s \n" , yytext ) ;
			numErros++;
		}
\n		return 0 ;
<<EOF>>		return 0 ;

%%


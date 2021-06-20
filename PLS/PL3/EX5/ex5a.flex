
%{
  #include <ctype.h> 
  #include "ex5a.tab.h" // header gerado pelo bison

  extern int numErros;
%}


%%

\;				return yytext[0];
(([1-9][0-9]*)|0)\.[0-9]+	yylval.real=atof(yytext);	return REAL;
([1-9][0-9]*)|0			yylval.inteiro=atoi(yytext);	return INT;
[_a-zA-Z]			yylval.id=tolower(yytext[0]);	return ID;
[-+*/()=]			return yytext[0];
[ \n\r\t]				/* ignorado */

.          printf("Erro lexico: simbolo desconhecido %s \n",yytext); numErros++;

<<EOF>>                  return 0;

%%


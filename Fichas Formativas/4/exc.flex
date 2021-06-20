%{
	#include <stdio.h>	
	#include <stdlib.h>
	#include <string.h>
	#include "exc.tab.h"
%} 

%%

ISEP|ISCAP|ESE          {yylval.str = strdup(yytext); return TK_ESCOLA;}
\"[^\"]{0,40}\"         {  /* retira aspas */
			   yylval.str = strndup(yytext+1, strlen(yytext)-2); 
			   return TK_STRING;
			}
[1-9][0-9][0-9]+        {yylval.num = atoi(yytext); return TK_NUM;}
\n                      return yytext[0];

[ \r\t]

.		printf("Erro Lexico: carácter inválido (%s)\n", yytext); 

<<EOF>>		return 0;

%%


%{
	#include <stdio.h>	
	#include <stdlib.h>
	#include "moedas.tab.h" 
%} 

%%
cafe		yylval.valor = 0.35; return TK_PRODUTO;
pingo		yylval.valor = 0.35; return TK_PRODUTO;
cha		yylval.valor = 0.35; return TK_PRODUTO;
chocolate	yylval.valor = 0.40; return TK_PRODUTO;
copo		yylval.valor = 0.05; return TK_PRODUTO;
leite		yylval.valor = 0.30; return TK_PRODUTO;

E([12].00|0.[125]0|0.0[125])	yylval.valor = atof(++yytext); return TK_MOEDA;

[\n\,]		return yytext[0]; 
[ \t\r]*                  
.		printf("Erro Lexico: carácter inválido (%c)\n", yytext[0]); 
<<EOF>>		return 0;

%%


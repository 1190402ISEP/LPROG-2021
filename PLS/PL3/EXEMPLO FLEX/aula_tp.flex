
%{
	#include <stdio.h>
	int qtdNumeros=0, nLinhas=0;
%}

ALGARISMO [0-9]

%%
   /* Se a ação for descrita numa só linha as chavetas podem ser omitidas */

\n	nLinhas++;
{ALGARISMO}+	{printf("d %s \n",yytext);qtdNumeros++;}
.

%%
int main ()
{
	yylex();
	printf("#linhas=%d\n",nLinhas);
	printf("#numeros=%d\n",qtdNumeros);
}


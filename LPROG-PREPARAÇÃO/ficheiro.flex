%{
#include <string.h>
#include "ficheiro.tab.h"
%}

ALFANUMERICOS   [A-Za-z0-9]
MIN [a-z0-9]
SIGILO 	([0-9]|10)


%%
@{ALFANUMERICOS}{1,15}   yylval.string=strdup(yytext);return ID;
\".+\"  return MENSAGEM;
#{ALFANUMERICOS}{1,10}   return HASH;
{SIGILO} yylval.inteiro=atoi(yytext);return SIGILO;
[,\n]   return yytext[0];
.
%%
%{
#include "helloworld-amb.tab.h"
%}

%%
[Hh][Ee][Ll][Ll][Oo] return TK_HELLO;
[Ww][Oo][Rr][Ll][Dd] return TK_WORLD;
[A-Za-z]+            return TK_WORD;
[ \t\r\n]+
.                    printf("Erro Lexico: carácter inválido (%d)\n", yytext[0]);
<<EOF>>              return 0;

%%

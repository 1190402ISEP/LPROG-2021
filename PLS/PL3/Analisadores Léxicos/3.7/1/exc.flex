%{
 int num=0, numOutras=0;
%}

%option noyywrap
%option nounput
%option noinput
%option case-insensitive

PALAVRA     Rei
SEPARADOR   [ \t\r\n,.]

%%

{SEPARADOR}{PALAVRA}{SEPARADOR}   {num++;}
{PALAVRA}                         {numOutras++;}
.|\n        /* Ignorar o outro texto */

%%

int main()
{
  yylex();
  printf("Numero de vezes que a palavra Rei aparece no texto: %d\n" , num);
  printf("Numero de vezes que a sequencia Rei aparece noutras palavras: %d\n" , numOutras);
  return 0;
}
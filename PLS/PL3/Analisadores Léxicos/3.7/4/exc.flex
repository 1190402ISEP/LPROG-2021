%{
 int qtdNum=0, qtdLetras=0, qtdLinhas=0,qtdEspacosTab=0,outrosChars=0;
%}

%option noyywrap
%option nounput
%option noinput
%option case-insensitive


DIGITO [0-9]
LETRA [a-zA-Z]
LINHA [\n?]
ESPACO_TABULACAO [ |\t]

%%

{DIGITO} {qtdNum++;}
{LETRA} {qtdLetras++;}
{LINHA} {qtdLinhas++;}
{ESPACO_TABULACAO} {qtdEspacosTab++;}
. {outrosChars++;}

%%

int main()
{
  yylex();
  printf("Nr Digs: %d\nNr Letras: %d\nNr Linhas: %d\nNr espacos e tabs: %d\nNr outros Caracteres: %d\n",qtdNum,qtdLetras,qtdLinhas,qtdEspacosTab,outrosChars);
  return 0;
}
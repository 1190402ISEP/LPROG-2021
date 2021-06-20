%{
   int numAlgarismos=0;
   int numLetras=0;
   int numSpaces=0;
   int numLinhas=1;
   int numOthers=0;
%}

%option noyywrap
%option nounput
%option noinput

DIGITO  [0-9]
LETRA   [A-Za-z]

%%

{DIGITO}  {  numAlgarismos++; }
{LETRA}   {  numLetras++; }
[ \t]     {  numSpaces++; }
\r?\n     {  numLinhas++; } /* para processar EoL DOS/Windows */
.         {  numOthers++; }

%%

int main()
{
  yylex();
  printf("Num. de Algarismos: %d\n",numAlgarismos);
  printf("Num. de Letras: %d\n",numLetras);
  printf("Num. de Linhas: %d\n",numLinhas);
  printf("Num. de Espaços: %d\n",numSpaces);
  printf("Num. de Outros: %d\n",numOthers);

  return 0;
}
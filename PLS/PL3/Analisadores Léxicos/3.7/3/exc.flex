%option noyywrap
%option nounput
%option noinput
  /* %option case-insensitive */


DIGITO  [0-9]
LETRA [A-Z]


MAT1        {LETRA}{2}-{DIGITO}{2}-{DIGITO}{2}
MAT2        {DIGITO}{2}-{LETRA}{2}-{DIGITO}{2}
MAT3        {DIGITO}{2}-{DIGITO}{2}-{LETRA}{2}
MAT4        {LETRA}{2}-{DIGITO}{2}-{LETRA}{2}
BLANKS      [ \t\r]*
MATRICULAS  {BLANKS}({MAT1}|{MAT2}|{MAT3}|{MAT4}){BLANKS}

%%

{MATRICULAS}  {
                printf("Matricula válida: %s\n",yytext);
              }

.*            {
                printf("Matricula inválida: %s\n",yytext);
                }
\n            /* ignorado */

%%


int main()
{
  yylex();
  return 0;
}
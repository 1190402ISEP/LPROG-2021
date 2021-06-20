
%option noyywrap
%option nounput
%option noinput
%option case-insensitive


%%

FEUP {printf("ISEP");}
2007 {printf("2008");}

%%
int main ()
{
	yylex();
	printf("\n");
	return 0;
}


%{
 #include <stdio.h>
 #include <string.h>

 int yylex();
 int yyerror(char *s);

 int maxDestinatarios=-1, maxSigilo=-1;
 void processar(char *remetente, int ndestinatarios, int nhashtags, int sigilo);
%}

%union {
char *string;
int inteiro;
}

%token <string> ID MENSAGEM HASH
%token <inteiro> SIGILO

%type <inteiro> listaDestinatarios listaHash listaHashOpcional

%%

start: /*vazio*/
	| start linha '\n'
	;

linha: ID MENSAGEM listaHashOpcional {processar($1,0,$3,0);}
	| ID listaDestinatarios MENSAGEM listaHashOpcional SIGILO {processar($1,$2,$4,$5);}
	;

listaDestinatarios: ID {$$ = 1;}
	| listaDestinatarios',' ID {$$ = $1 + 1;}
	;

listaHashOpcional: /*vazio*/ {$$ = 0;}
	| listaHash {$$ = $1;}
	;

listaHash: HASH {$$ = 1;}
	| listaHash','HASH {$$ = $1 + 1;}
	;

%%

/*
A lista de hash bem como o destinatário são opcionais
*/

int main(){

	yyparse();
	printf("A mensagem com mais destinatários tem sigilo= %d destinatários\n ",maxSigilo);

return 0;

}

void processar(char *remetente, int ndestinatarios, int nhashtags, int sigilo){

	printf("%s: ",remetente);

	if(ndestinatarios==0){
		printf("publica ");
	}else{
	printf("privada %d ", sigilo);
	}

	printf("N: %d\n",nhashtags);

	if(ndestinatarios > maxDestinatarios){
		maxDestinatarios=ndestinatarios;
		maxSigilo= sigilo;
	}

}

int yyerror(char *s){
	printf("Erro semântico: %s\n",s);
}
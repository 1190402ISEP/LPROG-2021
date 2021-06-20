
grammar HelloWorld ;


phrase : (HELLO WORLD {System.out.println("Hello World!!!");} | HELLO | WORLD | WORD)* ;


// phrase	: 	/* vazio */
//     | phrase HELLO WORLD {System.out.println("Hello World!!!");}
// 	| phrase HELLO
// 	| phrase WORLD
// 	| phrase WORD
// 	;


HELLO : [Hh][Ee][Ll][Ll][Oo] ;
WORLD : [Ww][Oo][Rr][Ll][Dd] ;
WORD : [A-Za-z]+ ;
WS : [ \t\r\n.,?!"']+ -> skip ; // skip spaces, tabs, newlines

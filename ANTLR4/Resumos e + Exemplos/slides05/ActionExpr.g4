grammar ActionExpr; // nome da gramática 

@parser::header { // classes a incluir
    import java.util.*;
    import java.lang.*;
    import java.io.*;
}

@parser::members { // HashMap para guardar valores das variáveis 
	Map<String, Integer> memory = new HashMap<String, Integer>();
}


/** Regra inicial; começa o parsing aqui. */
prog: stat+ ;

// só uma expressão, apresenta resultado
stat: expr NEWLINE {System.out.println($expr.v);}
     // atribuição, guarda na tabela de hash o resultado
     | ID '=' expr NEWLINE  { 
				String id = $ID.getText();
				 memory.put(id, $expr.v);
				 System.out.println(id+":"+$expr.v);
				} 
	// linha em branco
	| NEWLINE 
     ;
 

expr returns [int v]       // v serve para guardar resultado
    : a=expr op=('*'|'/') b=expr {
                      if ( $op.getType()==MUL )
                           $v = $a.v * $b.v;
                      else
                           $v = $a.v / $b.v;
                     }
    | a=expr op=('+'|'-') b=expr {
			if ( $op.getType()==ADD )
			      $v = $a.v + $b.v;
			 else
			      $v = $a.v - $b.v;
			}
    | INT 	{$v = Integer.valueOf($INT.getText());}
    | ID 	     { String id = $ID.getText();
		       if ( memory.containsKey(id) )
		          $v = memory.get(id);
			} 
    | '(' e=expr ')' {$v = $e.v;}
    ; 

// atribui nomes aos operadores para usar na
// gramática em cima, e identificar a operação
MUL : '*' ;
DIV : '/' ;
ADD : '+' ;
SUB : '-' ; 

     // reconhece identificadores
     // reconhece inteiros
ID : [a-zA-Z]+ ;
INT : [0-9]+ ; 

NEWLINE:'\r'? '\n' ;  // devolve o fim de linha para
                      // terminar a expressão
WS : [ \t]+ -> skip ; // ignora os espaços e tabs


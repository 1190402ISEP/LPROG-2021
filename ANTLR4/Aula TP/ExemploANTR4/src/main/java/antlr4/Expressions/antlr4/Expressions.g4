// Expressions.g4

grammar Expressions;

start : expr ;

expr : 	left=expr op=('*'|'/') right=expr # opExprMulDiv
      | left=expr op=('+'|'-') right=expr # opExprSumDif 
      | atom=INT #atomExpr
      ;
INT : ('0'..'9')+ ;
WS : [ \t\r\n]+ -> skip ;

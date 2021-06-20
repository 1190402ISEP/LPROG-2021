
grammar oprelex3 ;


@parser::header { // classes a incluir
    import java.util.*;
    import java.lang.*;
    import java.io.*;
}

@parser::members { 
    void compara(String v1, int op, String v2)
    {
        int x1, x2;

        if (Character.isLetter(v1.charAt(0)) && Character.isLetter(v2.charAt(0))) {
            x1 = v1.charAt(0);  x2 = v2.charAt(0);
        }
        else {
            if (Character.isDigit(v1.charAt(0)) && Character.isDigit(v2.charAt(0))) {
                x1 = Integer.valueOf(v1);  x2 = Integer.valueOf(v2);
            }
            else
            {
                System.out.println("Incompativel" );
                return;
            }
        }

        switch (op) {
            case TK_EQ:   System.out.println(x1 == x2 ? "verdadeiro" : "falso" );  break;
            case TK_NEQ:  System.out.println(x1 != x2 ? "verdadeiro" : "falso" );  break;
            case TK_LT:   System.out.println(x1 < x2  ? "verdadeiro" : "falso" );  break;
            case TK_GT:   System.out.println(x1 > x2  ? "verdadeiro" : "falso" );  break;
            case TK_LTE:  System.out.println(x1 <= x2 ? "verdadeiro" : "falso" );  break;
            case TK_GTE:  System.out.println(x1 >= x2 ? "verdadeiro" : "falso" );  break;
        }
    }
}


linhas : (expr? NEWLINE)* ; 

expr returns [String v]: 
        valor  {$v = $valor.v;}
    |   e=expr oper valor   { compara($e.v, $oper.type,  $valor.v);  $v = $e.v;}
    |   oper valor          { notifyErrorListeners("Sintax error: wrong number of expression operands");  $v = $valor.v;}
    |   e=expr oper         { notifyErrorListeners("Sintax error: wrong number of expression operands");  $v = $e.v;}
    |   e=expr valor        { notifyErrorListeners("Sintax error: missing operator");  $v = $e.v;}
    ;


oper returns [int type]:    op=(TK_EQ | TK_GT | TK_GTE | TK_LT | TK_LTE | TK_NEQ) {$type = $op.type;} 
    ;


valor returns [String v]: 
        TK_NUM      {$v = $TK_NUM.text;}
    |   TK_LETRA    {$v = $TK_LETRA.text;}
    ;


TK_NUM : [0-9]+ ;
TK_LETRA : [a-zA-Z] ;

TK_EQ  : '='    ;
TK_NEQ : '<''>' ;   // \<\>		return TK_NEQ;
TK_LT  : '<'    ;   // \<		return TK_LT;
TK_GT  : '>'    ;   // \>		return TK_GT;
TK_LTE : '<''=' ;   // \<\=		return TK_LTE;
TK_GTE : '>''=' ;   // \>\=		return TK_GTE;

NEWLINE:'\r'?'\n' ;  // devolve o fim de linha para

WS : [ \t]+ -> skip ; // ignora os espaços e tabs


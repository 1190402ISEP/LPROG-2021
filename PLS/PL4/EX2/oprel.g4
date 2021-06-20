
grammar oprel ;


@parser::header { // classes a incluir
    import java.util.*;
    import java.lang.*;
    import java.io.*;
}

@parser::members { 
    void compare(String v1, int op, String v2)
    {
        int x1 = Integer.valueOf(v1),
            x2 = Integer.valueOf(v2);

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


exprs : (expr? NEWLINE)* ;

// exprs	:	/* vazio */
// 		   | exprs expr NEWLINE
//         | exprs NEWLINE
// 		;

expr : a=TK_NUM oper b=TK_NUM { 
                compare($a.text, $oper.type,  $b.text);
        }
        |  TK_NUM* oper TK_NUM* {notifyErrorListeners("Sintax error: wrong number of expression operands");}
        |  TK_NUM TK_NUM   {notifyErrorListeners("Sintax error: missing operator");}
    // |  (TK_NUM | oper)+ {notifyErrorListeners("Sintax error");}
    // |  TK_NUM oper   {notifyErrorListeners("Sintax error: int op");}
    // |  oper TK_NUM   {notifyErrorListeners("Sintax error: op int");}
    // |  TK_NUM TK_NUM {notifyErrorListeners("Sintax error: int int");}
    ;

oper returns [int type]:    op=(TK_EQ | TK_GT | TK_GTE | TK_LT | TK_LTE | TK_NEQ) {$type = $op.type;} 
    ;


// expr	:	  a=TK_NUM TK_EQ  b=TK_NUM { compare($a.getText(), TK_EQ,  $b.getText());  }
//         | 	  a=TK_NUM TK_NEQ b=TK_NUM { compare($a.getText(), TK_NEQ, $b.getText());  }
//         | 	  a=TK_NUM TK_LT  b=TK_NUM { compare($a.getText(), TK_LT,  $b.getText());  }
//         | 	  a=TK_NUM TK_GT  b=TK_NUM { compare($a.getText(), TK_GT,  $b.getText());  }
//         | 	  a=TK_NUM TK_LTE b=TK_NUM { compare($a.getText(), TK_LTE, $b.getText());  }
//         | 	  a=TK_NUM TK_GTE b=TK_NUM { compare($a.getText(), TK_GTE, $b.getText());  }
// 		;


TK_NUM : [0-9]+ ;

TK_EQ  : '='    ;
TK_NEQ : '<''>' ;   // \<\>		return TK_NEQ;
TK_LT  : '<'    ;   // \<		return TK_LT;
TK_GT  : '>'    ;   // \>		return TK_GT;
TK_LTE : '<''=' ;   // \<\=		return TK_LTE;
TK_GTE : '>''=' ;   // \>\=		return TK_GTE;

NEWLINE:'\r'?'\n' ;  // devolve o fim de linha para

WS : [ \t]+ -> skip ; // ignora os espaços e tabs


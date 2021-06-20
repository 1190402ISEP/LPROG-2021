package expressions;
import java.io.*;
import java.util.*;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import Expressions.antlr4.*;
public class Expressions {
public static void main(String[] args) throws IOException {

        System.out.println("Result with Listener : ");
        parseWithListener();
    }

public static void parseWithListener() throws IOException {
    ExpressionsLexer lexer = new ExpressionsLexer(CharStreams.fromFileName("teste.txt"));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    ExpressionsParser parser = new ExpressionsParser(tokens);
    ParseTree tree = parser.start(); // parse
    ParseTreeWalker walker = new ParseTreeWalker();
    EvalListener eListener = new EvalListener();
    walker.walk(eListener, tree);
    System.out.println(eListener.getResult());
  }


}


class EvalListener extends ExpressionsBaseListener {

private final Stack<Integer> stack = new Stack<>();
        public int getResult() {
        return stack.peek();
        }

@Override
public void enterAtomExpr(ExpressionsParser.AtomExprContext ctx)
 { stack.push(Integer.valueOf(ctx.atom.getText()));
}


@Override
public void exitOpExprMulDiv(ExpressionsParser.OpExprMulDivContext ctx)
{ int right = stack.pop();
  int left = stack.pop();
  int result;
if (ctx.op.getText().charAt(0)=='*') {
            result = left * right;
        } else {
            result = left / right;
        }
        stack.push(result);
    }

@Override public void exitOpExprSumDif(ExpressionsParser.OpExprSumDifContext ctx)
  { int right = stack.pop();
     int left = stack.pop();
     int result;
if (ctx.op.getText().charAt(0)=='+') {
            result = left + right;
        } else {
            result = left - right;
        }
        stack.push(result);
    }
}

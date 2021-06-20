package expressions;
import java.io.*;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import Expressions.antlr4.*;
public class Expressions {
public static void main(String[] args) throws IOException {
        System.out.println("Result with Visitor : ");
	    parseWithVisitor();
	    }
	    
public static void parseWithVisitor() throws IOException { 

	ExpressionsLexer lexer = new ExpressionsLexer(CharStreams.fromFileName("teste.txt"));
	CommonTokenStream tokens = new CommonTokenStream(lexer);
	ExpressionsParser parser = new ExpressionsParser(tokens);
	ParseTree tree = parser.start(); // parse
	EvalVisitor eval = new EvalVisitor();
	int value = eval.visit(tree); 
	System.out.println(value); // print the result
	}


public static class EvalVisitor extends ExpressionsBaseVisitor<Integer> { 
	@Override
	public Integer visitStart(ExpressionsParser.StartContext ctx) { 
		return visitChildren(ctx);
	}
	@Override
	public Integer visitAtomExpr(ExpressionsParser.AtomExprContext ctx) {
	return Integer.parseInt(ctx.atom.getText());
       	} 

	@Override
	public Integer visitOpExprMulDiv(ExpressionsParser.OpExprMulDivContext ctx) {
	int left = visit(ctx.left), right = visit(ctx.right);
       	switch (ctx.op.getText().charAt(0)) {
            case '*' : return left * right;
            case '/' : return left / right;
            }
	return 0;
       	}
	@Override
	public Integer visitOpExprSumDif(ExpressionsParser.OpExprSumDifContext ctx) {
	int left = visit(ctx.left), right = visit(ctx.right);
       	switch (ctx.op.getText().charAt(0)) {
            case '+' : return left + right;
            case '-' : return left - right;
            }
	return 0; 
	}

}

}

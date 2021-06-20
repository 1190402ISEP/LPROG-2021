// Generated from E:/GITHUB 1190402/Licenciatura/2�ANO/2�SEMESTRE/LPROG/ANTLR4/Aula TP/ExemploANTR4/src/main/java/antlr4/Expressions/antlr4\Expressions.g4 by ANTLR 4.9.1
package antlr4.Expressions.antlr4;

import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link ExpressionsParser}.
 */
public interface ExpressionsListener extends ParseTreeListener {
    /**
     * Enter a parse tree produced by {@link ExpressionsParser#start}.
     *
     * @param ctx the parse tree
     */
    void enterStart(ExpressionsParser.StartContext ctx);

    /**
     * Exit a parse tree produced by {@link ExpressionsParser#start}.
     *
     * @param ctx the parse tree
     */
    void exitStart(ExpressionsParser.StartContext ctx);

    /**
     * Enter a parse tree produced by the {@code opExprMulDiv}
     * labeled alternative in {@link ExpressionsParser#expr}.
     *
     * @param ctx the parse tree
     */
    void enterOpExprMulDiv(ExpressionsParser.OpExprMulDivContext ctx);

    /**
     * Exit a parse tree produced by the {@code opExprMulDiv}
     * labeled alternative in {@link ExpressionsParser#expr}.
     *
     * @param ctx the parse tree
     */
	void exitOpExprMulDiv(ExpressionsParser.OpExprMulDivContext ctx);
	/**
	 * Enter a parse tree produced by the {@code opExprSumDif}
	 * labeled alternative in {@link ExpressionsParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterOpExprSumDif(ExpressionsParser.OpExprSumDifContext ctx);
	/**
	 * Exit a parse tree produced by the {@code opExprSumDif}
	 * labeled alternative in {@link ExpressionsParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitOpExprSumDif(ExpressionsParser.OpExprSumDifContext ctx);
	/**
	 * Enter a parse tree produced by the {@code atomExpr}
	 * labeled alternative in {@link ExpressionsParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterAtomExpr(ExpressionsParser.AtomExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code atomExpr}
	 * labeled alternative in {@link ExpressionsParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitAtomExpr(ExpressionsParser.AtomExprContext ctx);
}
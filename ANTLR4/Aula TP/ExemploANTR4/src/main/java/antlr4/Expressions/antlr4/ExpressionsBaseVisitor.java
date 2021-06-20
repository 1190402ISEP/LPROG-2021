// Generated from E:/GITHUB 1190402/Licenciatura/2�ANO/2�SEMESTRE/LPROG/ANTLR4/Aula TP/ExemploANTR4/src/main/java/antlr4/Expressions/antlr4\Expressions.g4 by ANTLR 4.9.1
package antlr4.Expressions.antlr4;

import org.antlr.v4.runtime.tree.AbstractParseTreeVisitor;

/**
 * This class provides an empty implementation of {@link ExpressionsVisitor},
 * which can be extended to create a visitor which only needs to handle a subset
 * of the available methods.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 *            operations with no return type.
 */
public class ExpressionsBaseVisitor<T> extends AbstractParseTreeVisitor<T> implements ExpressionsVisitor<T> {
    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override
    public T visitStart(ExpressionsParser.StartContext ctx) {
        return visitChildren(ctx);
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override
    public T visitOpExprMulDiv(ExpressionsParser.OpExprMulDivContext ctx) {
        return visitChildren(ctx);
    }

    /**
     * {@inheritDoc}
     *
     * <p>The default implementation returns the result of calling
     * {@link #visitChildren} on {@code ctx}.</p>
     */
    @Override
    public T visitOpExprSumDif(ExpressionsParser.OpExprSumDifContext ctx) {
        return visitChildren(ctx);
    }

    /**
	 * {@inheritDoc}
	 *
	 * <p>The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.</p>
	 */
	@Override public T visitAtomExpr(ExpressionsParser.AtomExprContext ctx) { return visitChildren(ctx); }
}
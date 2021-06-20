1.

a) Símbolos Terminais: a, ( )
Símbolos Não Terminais: L,S

        VÍRGULA E PARENTESIS NÃO SÃO ESPECIAIS-Terminais
        Letras maiúsculas- terminais

        b) (a,a)


S => (L) => (L,S)  => (S,S) => (a,S) => (a,a)
Aplicada uma derivação de cada vez!!

c)
Não há um autómato relativo a esta gramática pois ela do  tipo 2 e não do tipo 3 como era necessário.

d)
G = ({S,L},{a,',',(, )},{S-> (L)|a, L -> L,S|S},  S)
________________________________________________________________
        Notas:
Formalmente, uma gramática é definida pelo tuplo G = (V, Σ, P, S), no qual:
V – um conjunto finito, não vazio, de variáveis (símbolos não terminais);
Σ – é um conjunto finito, não vazio, dito alfabeto ou conjunto de símbolos
terminais;
P – conjunto de produções, regras da gramática. A sua forma geral é a
seguinte: α → β que definem a forma como o conjunto de símbolos α podem
ser substituídos pelo conjunto de símbolos β;
S – símbolo inicial a partir do qual todas as frases são derivadas.
________________________________________________________________


2.

a)  S -> aL
        L -> S | bL | b
(Tipo2)

S -> aLB
        L -> aL | bL | ε
(Tipo2)

S -> aL
        L -> aL | bL |  b
(Tipo3)


b)
S -> aL | aS | cS | dS | a | c | d
        L -> b | bS

        S -> aL | cL | dL | L
        L -> abS | S | ε

        S -> abL | L
        L -> aS | cS | dS | ε

        c)
S -> aLa | bLb | cLc | dLd
        L -> S | a | b | c | d | ε

        ACBCA
S=> aLa => aSa => acLca => acbca

3.
EURO-> e NumVirg | NumVirg "EUR"
NumVirg-> Inteiro , Dig Dig
Inteiro-> Dig Inteiro | Dig
        Dig-> 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9

LIBRA-> £ NumPonto
NumPonto-> Inteiro . Dig Dig

Dolar-> $ NumPonto

Escudo -> Inteiro $ Dig Dig


4.
a) G = ({S,T,B}, {x,y,z}, {S -> TyBT , T -> xT | x ,B -> zB | ε }, S)

b)Tipo 2-> à esquerda temos 1 símbolo não terminal singular e à direita temos símbolos terminais e não terminais

        c) x+yz*x+
Em anexo

5.

a)V

        b)Não é válida porque dois 'y´
6.
a)
S-> (L)|a
        L->A+S|b
        A->a|L
(b+(a+a)+a)
S => (L) => (A+S) => (A+a) => (A+S+a) => (A+(L)+a) => (A+(A+S)+a) => (A+(A+a)+a) => (A+(a+a)+a)
=> (L+(a+a)+a) => (b+(a+a)+a)
b) Tipo 2 -> à esquerda temos 1 símbolo não terminal singular e à direita temos símbolos terminais e não terminais
        c) Não tem solução devido à dupla recursividade
        d)
S -> LTB
        L -> #L | @L | ε
        T -> @|#
B -> #B | ε

7.

a) G = ({S} , {a,b}, {S->aS | Sb | ab | SS},S)

        Expressão Regular:  a(a|b)*b <=> (a+b+)+
aaba

S => aS => aSb => aabb  x->não é válida


bab

S= Sb=> x->não é válida


abbabaabb
S => Sb => S

S => Sb => SSb => SSSb => SbSSb => abbSSb => abbabSb => abbabaSb = > abbabaabb

b) aaabb
 S => aS => aaS => aaSb => aaabb     ->válida

c) aaabb
árvores de derivação em anexo

S => aS => aaS => aaSb => aaabb

S => Sb => aSb => aaSb => aaabb
é ambígua pois com uma palavra se conseguiu produzir duas árvores de derivação


8.

a) if b then if b then a else a

S => if b then S else S => if b then if b then S else S => if b then if b then a else S => if b then if b then a else a


S => if b then S => if b then if b then S else S => if b then if b then a else S => if b then if b then a else a


b)
S-> A|B
A-> if b then A else A|a
B-> if b then S | if b then A else B

if b then if b then a else a

S=> B => if b then S => if b then A => if b then if b then A else A => if b then if b then a else A =>
        => if b then if b then a else a

9)
S0 -> aS1 | E\{a}S
S1 -> aS1 | E\{a,e}S | eS2
S2 -> aS1 | E\{a,i}S | iS3
S3 -> aS1 | E\{a,o}S | oS4
S4 -> aS1 | E\{a,u}S | uS5
S5 -> ES5 | ε

10.
int a, x1=10, y=x1;
long int numero;
unsigned char c = 'a';
long double real = 1,234e-5, pi=3,14159265358979, num1, num2;
<declaracoes> -> <declaracao><declaracoes>|ε
<declaracoes> -> <tipo><lista_variaveis>
<tipo> -> <mod_sinal><mod_comprimento><tipo_base>
<mod_sinal> unsigned | signed | ε
<mod_comprimento> short | long |ε
<tipo_base> int | char | float | double
<lista_variaveis> -> <variavel> , <lista_variaveis> | <variavel>
<variavel> -> <ident> | <ident> = <ident> | <ident> = <constante>;
<ident> -> <letra_und> <letras_und_digs>
<letra_und> -> <letra> | '_'
<letras_und_digs>

::::::
______________
<declaracoes> → <declaracao><declaracoes>|ε
<declaracao> → <tipo><lista_variaveis>;

<tipo> → <mod_sinal><mod_comprimento><tipo_base>
<mod_sinal> → unsigned | signed | ε
<mod_comprimento> → short | long | ε
<tipo_base> → int | char | float | double

<lista_variaveis> → <variavel>, <lista_variaveis> | <variavel>
<variavel> → <identificador> | <identificador> = <identificador> | <identificador> = <constante>

<identificador> -> <letra> <simbolos> | _ <simbolos>
<simbolos> -> <simbolo> <simbolos> | ε
<simbolo> -> _ | <letra> | <digito>
<letra> -> a | A | b | … | z | Z
<digito> -> 0 | 1 | 2 | … | 8 | 9

<constante> -> <const_char> | <const_inteiro> | <const_realf> | <const_reale>

<const_char> -> "´" <ascii> "´"
<ascii> -> <simbolo> | <outros>
<outros> -> ? | ! | ...

<const_inteiro> -> - <inteiro> | + <inteiro> | <inteiro>
<inteiro> -> <digito> <inteiro> | <digito>

<const_realf> -> <const_inteiro> . <inteiro>

<const_reale> -> <const_realf> e <const_inteiro>

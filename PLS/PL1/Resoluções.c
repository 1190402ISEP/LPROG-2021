1.
a) Começa e acaba em 0
b) Sequências de 01 repetidas n vezes
c) Ter o fator 0 e ter um sufixo que começa em 0 e tem mais dois dígitos
d) Apenas pode ter 3 1s e pode ter 0(infinitas vezes)
e) Fator 111 de todas as palavras

2.

a) [A-Za-z]*aa[A-Za-z]*
b) [A-Za-z]{0,3} ou [A-Za-z]{,3} ou [A-Za-z]?[A-Za-z]?[A-Za-z]?
c) [A-Z][A-Za-z]
d) Não é Possível

3.

a) F
b) V

4.

a) (0|1)*00 ou 0|1(0|1)*00
b) 1?1?(01?1?)*
c) 0*(10*1)*0* ou 0*(10*10*)*
d) (00)*|1(11)* | e  ou (0{2}*|11{2}*)*
e) (0|1)*100
f) (0|1){3} ou (0|1)(0|1)(0|1)

5.

(1?[0-9]|20 F|E|RF)+ ou ((1?[0-9]|20) (E|R?F))+

6.

LT[0-9]{5}-[A-Za-z0-9]{4}-[0-9]{2}-[0-9]{5}-(1[0-2] | 0[1-9])(0[0-9]|1[0-9]|2[0-9]|3[0-1])

//(0[1-9]|[12][0-9]|3[01])

7.
([1-2]?(E?P)~)?((([0-9]{2}|1(0|1)[0-9]):([0-5][0-9]]))|120:00)~([A-Z]{3})>([0-9]|10)-([0-9]|10)<([A-Z]{3})


AUTÓMATOS FINITOS


1.
a)
(a|c|d)*(ab(a|b|c|d)*))?

/ou

[acd]*(ab[a-d]*)?

b)

δ(s0,a) = {s0,s1}
δ(s0,c|d) = {s0}
δ(s1,b) = {s2}
δ(s2,a|b|c|d) = {s2}


c)
      |   a         |     b       |     c|d     |
->*s0 |   {s0,s1}   |      0      |     {s0}    |
   s1 |     0       |     {s2}    |      0      |
  *s2 |     {s2}    |     {s2}    |     {s2}    |

2.

a)
(a|b)*abb

b)
δ(s0,a) = {s0,s1}
δ(s0,b) = {s0}
δ(s1,b) = {s2}
δ(s2,b) = {s3}

c)
      |   a         |     b       |
-> s0 |   {s0,s1}   |     {s0}    |
   s1 |     0       |     {s2}    |
   s2 |     0       |     {s3}    |
  *s3 |     0       |      0      |


3.
[0-9]*,[0-9]+

4.

#include<stdio.h>


int main() {

    int a;

    int real = 1;

    char estado = 'A';

    int erro = 0;



    printf("Introduza dados:");

    while (((a = getchar()) != '\n’) && (erro==0))

        switch (estado) {

            case 'A' :

                if ((a >= '0') && (a <= '9'))

                    estado = 'A';

                else if (a == ',')

                    estado = 'B';

                else

                    erro = 1;

                break;



            case 'B' :

                if ((a >= '0') && (a <= '9'))

                    estado = 'C';

                else

                    erro = 1;

                break;



            case 'C' :

                if ((a >= '0') && (a <= '9'))

                    estado = 'C';

                else

                    erro = 1;

                break;

        }

    if ((!erro) && (estado == 'C')){

        printf("Foi lido um real.\n");

	}

    else{



        printf("Não foi lido um real.\n");

	}

    return 0

}

O programa implementa um autómato para validar um input (o autómato da pergunta 3).
[0-9]*,[0-9]+
(não determinístico- qualquer símbolo implica para transitar
para um único estado.)


5.

a)
Euro : e[0-9]+,[0-9][0-9]|[0-9]+,[0-9]EUR
Libra: &[0-9]+,[0-9][0-9]
Dolar: $[0-9]+.[0-9][0-9]
Escudo: [0-9]+$[0-9][0-9]

b)
(e(0|[1-9]+[0-9]+),([0-9][0-9]|[0-9])) | ((0|[1-9]+[0-9]+),([0-9][0-9]|[0-9])EUR)


6)

a.
[a-z]+[A-Z]?[a-z]*[A-Z]?[a-z]*

b.[A-Z][a-zA-Z]*[aeiouAEIOU]
  ou
  [AEIOU]


8.

a) (0|1)*00
b) (0|1)*111(0|1)*
c) 0*(10*1)*0*
d) (0{2}*|11{2}*)*


9.

a)

aa*|bb*

Determinístico->com o mesmo símbolo apenas se consegue transitar para um
estado


b)

(a|b)*abb(a|b)*

Não Determinístico e S0 pode transitar para S0 e S1 em simultâneo recebendo "a"


7.

A)
0*1*2*3*4*5*6*7*8*9*

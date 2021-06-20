#include<stdio.h>

int main() {
    int a;
    int real = 1;
    char estado = 'A';
    int erro = 0;

    printf("Introduza dados:");
    while (((a = getchar()) != '\n’) && (erro==0)){
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
    if ((!erro) && (estado == 'C'))
        printf("Foi lido um real.\n");
    else

        printf("Não foi lido um real.\n");
    return 0
}
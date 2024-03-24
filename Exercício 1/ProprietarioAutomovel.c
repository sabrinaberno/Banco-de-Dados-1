#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Strucut com dados do automóvel
typedef struct {
    char placa[8];
    char marca[50];
    char modelo[50];
    char ano[4];
} Automovel;

// Struct com dados do cliente / proprietário do automóvel
typedef struct {
    char nome[100];
    char cpf[12];
    int num_carros;
    Automovel carros[10]; 
}ProprietarioAutomovel;


FILE *arquivoProprietario;
FILE* arquivoAutomoveis;

ProprietarioAutomovel proprietario;
Automovel carro;

int main() {
    

    int opcao=0;
    char CPF[11];
    char placa[7];

    do {
        printf("Menu:\n");
        printf("1. Cadastrar novo proprietario\n");
        printf("2. Listar Usuários e Automóveis\n");
        printf("3. Sair\n");
        printf("Escolha uma opcao: ");
        scanf("%d", &opcao);

        switch (opcao) {
            case 1:                 
                arquivoProprietario = fopen("dadosProprietario.bin", "ab");
                arquivoAutomoveis = fopen("dadosAutomovel.bin", "ab");

                printf("\n=== Cadastro de Proprietario ===\n");
                printf("Nome do proprietario: ");
                scanf(" %[^\n]", proprietario.nome);
                printf("Número do CPF do proprietario: ");
                scanf(" %s", CPF);

               while(fread(&proprietario, sizeof(ProprietarioAutomovel), 1, arquivoProprietario)){
                    if(strcmp(CPF, proprietario.cpf) == 0){
                        printf("Proprietário já cadastrado.\n");
                        break;
                    }
               }

                strcpy(proprietario.cpf, CPF);
 
                printf("Quantos carros deseja cadastrar para este proprietario? ");
                scanf(" %d", &proprietario.num_carros);

                printf("\n=== Cadastro de Carros ===\n");
                for (int i = 0; i < proprietario.num_carros; i++) {
                    printf("Carro %d:\n", i + 1);

                    printf("Placa do carro: ");
                    scanf(" %[^\n]", placa);

                    printf("Marca do carro: ");
                    scanf(" %[^\n]", proprietario.carros[i].marca);

                    printf("Modelo do carro: ");
                    scanf(" %[^\n]", proprietario.carros[i].modelo);

                    printf("Ano do carro: ");
                    scanf(" %[^\n]", proprietario.carros[i].ano);

                    while(fread(&proprietario, sizeof(ProprietarioAutomovel), 1, arquivoProprietario)){
                        if(strcmp(CPF, proprietario.cpf) == 0){
                            printf("Automóvel já cadastrado.\n");
                            break;
                        }
                    }
                    
                    strcpy(proprietario.carros[i].placa, placa);

                    fwrite(&carro, 1, sizeof(Automovel), arquivoAutomoveis);
                }
                
                fwrite(&proprietario, sizeof(ProprietarioAutomovel), 1, arquivoProprietario);
                
                fclose(arquivoAutomoveis);
                fclose(arquivoProprietario);
        
                printf("\n\nProprietário e carro(s) cadastrado(s)\n\n");

                break;
            case 2:
                arquivoProprietario = fopen("dadosProprietario.bin", "rb");
                arquivoAutomoveis = fopen("dadosAutomovel.bin", "rb");

                while(fread(&proprietario, sizeof(ProprietarioAutomovel), 1, arquivoProprietario)){
                     printf("\n=== Lista de Proprietários e Carros ===\n");

                     printf("Proprietário: %s\n", proprietario.nome);
                     printf("CPF: %s\n", proprietario.cpf);
                     
                     fseek(arquivoAutomoveis, 0, SEEK_SET);
                     for(int j = 0; j < proprietario.num_carros; j++){
                        printf("--Veiculo %d do proprietario--\n", j+1);
                        printf("\tPlaca: %s\n", proprietario.carros[j].placa);
                        printf("\tMarca: %s\n", proprietario.carros[j].marca);
                        printf("\tModelo: %s\n", proprietario.carros[j].modelo);
                        printf("\tAno: %s\n", proprietario.carros[j].ano);
                        printf("\n");
                     }

                }
                fclose(arquivoAutomoveis);
                fclose(arquivoProprietario);

                break;
            default:
                printf("Opcao invalida. Tente novamente.\n");
                break;
        }
    } while (opcao != 3);

    return 0;
}
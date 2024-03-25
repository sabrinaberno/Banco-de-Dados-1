#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Strucut com dados do automóvel
typedef struct {
    char placa[8];
    char marca[50];
    char modelo[50];
    char ano[5];
} Automovel;

// Struct com dados do cliente / proprietário do automóvel
typedef struct {
    char nome[100];
    char cpf[12];
    int num_carros;
    Automovel carros[10]; 
}ProprietarioAutomovel;

//declaração de variáveis globais
FILE *arquivoProprietario;
FILE* arquivoAutomoveis;

ProprietarioAutomovel proprietario;
Automovel carro;

//Declaração de estruturas auxiliares para ordenação
FILE *arquivoAuxiliar;
ProprietarioAutomovel auxiliado;
ProprietarioAutomovel auxiliar[100];


// Função para verificar se um proprietário já está cadastrado
int verificarProprietarioCadastrado(char* cpf) {
    arquivoProprietario = fopen("dadosProprietario.bin", "rb");
    
    // Reposicionar o cursor no início do arquivo
    rewind(arquivoProprietario);
    
    // Variável para armazenar temporariamente os dados do proprietário lido do arquivo
    ProprietarioAutomovel tempProprietario;
    
    // Ler cada registro do arquivo e comparar o CPF
    while (fread(&tempProprietario, sizeof(ProprietarioAutomovel), 1, arquivoProprietario) == 1) {
        if (strcmp(cpf, tempProprietario.cpf) == 0) {
            return 1;
            break; // Sai do loop assim que encontrar o proprietário
        }
    }
    fclose(arquivoProprietario);
    
    // Retorna 1 se o proprietário foi encontrado, 0 caso contrário
    return 0;
}


// Função que compara a ordenação de proprietários com a chave CPF
int comparaCPF (const void *x, const void *y){
    return strcmp(((ProprietarioAutomovel *)x)->cpf, ((ProprietarioAutomovel*)y)->cpf);
}

//Função que ordena proprietários por CPF usando o quick sort
void ordenaCPF(){
    int count=0;
    arquivoAuxiliar = fopen("dadosProprietario.bin", "rb");
    
    //transfere os dados dos proprietários para o array auxiliar
    while(fread(&auxiliar[count], sizeof(ProprietarioAutomovel), 1, arquivoAuxiliar)){
        count++;
    }

    qsort(auxiliar, count, sizeof(ProprietarioAutomovel), comparaCPF);
    fclose(arquivoAuxiliar);

    arquivoAuxiliar = fopen("dadosProprietario.bin", "wb");

    //escreve os dados ordenados de volta no arquivo original
    int i=0;
    while(i < count){
        fwrite(&auxiliar[i], 1, sizeof(ProprietarioAutomovel), arquivoAuxiliar);
        i++;
    }

    fclose(arquivoAuxiliar);
}


int main() {
    

    int opcao=0;
    char CPF[12];


    do {
        printf("Menu:\n");
        printf("1. Cadastrar novo proprietario\n");
        printf("2. Listar usuários e seus automóveis por CPF\n");
        printf("3. Sair\n");
        printf("Escolha uma opcao: ");
        scanf("%d", &opcao);

        switch (opcao) {
            //cadastro de um novo proprietário e seus automóveis
            case 1:                 
                arquivoProprietario = fopen("dadosProprietario.bin", "ab");
                arquivoAutomoveis = fopen("dadosAutomovel.bin", "ab");

                printf("\n=== Cadastro de Proprietario ===\n");
                printf("Nome do proprietario: ");
                scanf(" %[^\n]", proprietario.nome);
                printf("Número do CPF do proprietario: ");
                scanf(" %s", CPF);

                //verifica se o proprietário já foi cadastrado
                if(verificarProprietarioCadastrado(CPF) == 1) {
                    printf("\nProprietário já cadastrado.\n\n");
                    break;
                }

                strcpy(proprietario.cpf, CPF);
 
                printf("Quantos carros deseja cadastrar para este proprietario? ");
                scanf(" %d", &proprietario.num_carros);

                //Cadastros do(s) carro(s) do proprietário
                printf("\n=== Cadastro de Carros ===\n");
                for (int i = 0; i < proprietario.num_carros; i++) {
                    printf("Carro %d:\n", (i+1));

                    printf("Placa do carro: ");
                    scanf(" %[^\n]", proprietario.carros[i].placa);

                    printf("Marca do carro: ");
                    scanf(" %[^\n]", proprietario.carros[i].marca);

                    printf("Modelo do carro: ");
                    scanf(" %[^\n]", proprietario.carros[i].modelo);

                    printf("Ano do carro: ");
                    scanf(" %[^\n]", proprietario.carros[i].ano);

                    fwrite(&carro, 1, sizeof(Automovel), arquivoAutomoveis);

                }
                
                fwrite(&proprietario, sizeof(ProprietarioAutomovel), 1, arquivoProprietario);
                
                fclose(arquivoAutomoveis);
                fclose(arquivoProprietario);
        
                printf("\n\nProprietário e carro(s) cadastrado(s)\n\n");

                break;
            //Lista de usuários ordenados por CPF
            case 2: 
                arquivoProprietario = fopen("dadosProprietario.bin", "rb");
                arquivoAutomoveis = fopen("dadosAutomovel.bin", "rb");

                ordenaCPF();

                while(fread(&proprietario, sizeof(ProprietarioAutomovel), 1, arquivoProprietario)){
                     printf("\n=== Lista de Proprietários e Carros ===\n");

                     printf("Proprietário: %s\n", proprietario.nome);
                     printf("CPF: %s\n", proprietario.cpf);
                    
                    fseek(arquivoAutomoveis, 0, SEEK_SET);
                    for(int j = 0; j < proprietario.num_carros; j++){
                         fread(&carro, sizeof(Automovel), 1, arquivoAutomoveis);
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
            //Saída do programa
            case 3:
                printf("\nObrigada por usar meu programa!!\nTrabalho da disciplina Banco de Dados 1\n");
                printf("== Sabrina Caldas Berno ==\n");
                break;
            default:
                printf("Opcao invalida. Tente novamente.\n");
                break;
        }
    } while (opcao != 3);

    return 0;
}
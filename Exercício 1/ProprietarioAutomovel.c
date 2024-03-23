#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Definição da estrutura para o carro
struct Carro {
    char marca[50];
    char modelo[50];
    int ano;
};

// Definição da estrutura para o proprietário
struct Proprietario {
    char nome[100];
    int idade;
    char cpf[12];
    char rg[8];
    char cnh[11];
    struct Carro carros[10]; // Permitindo até 10 carros por proprietário
    int num_carros; // Número atual de carros cadastrados para este proprietário
};

// Função para cadastrar um novo carro
void cadastrarCarro(struct Carro *carro) {
    printf("Marca do carro: ");
    scanf("%s", carro->marca);
    printf("Modelo do carro: ");
    scanf("%s", carro->modelo);
    printf("Ano do carro: ");
    scanf("%d", &carro->ano);
}

// Função para cadastrar um novo proprietário e seus carros
void cadastrarProprietario(struct Proprietario *proprietario) {
    printf("Nome do proprietario: ");
    fgets(proprietario->nome, 100, stdin);

    printf("Idade do proprietario: ");
    scanf("%d", &proprietario->idade);
    getchar();

    printf("Número do CPF do proprietario: ");
    scanf("%s", proprietario->cpf);
    proprietario->cpf[strcspn(proprietario->cpf, "\n")] = '\0'; // Remover o caractere de nova linha


    printf("Número do RG do proprietario: ");
    scanf("%s", proprietario->rg);
    proprietario->rg[strcspn(proprietario->rg, "\n")] = '\0';

    printf("Número da CNH do proprietario: ");
    scanf("%s", proprietario->cnh);
    proprietario->cnh[strcspn(proprietario->cnh, "\n")] = '\0';

    printf("Quantos carros deseja cadastrar para este proprietario? ");
    scanf("%d", &proprietario->num_carros);

    printf("\n=== Cadastro de Carros ===\n");
    for (int i = 0; i < proprietario->num_carros; i++) {
        printf("Carro %d:\n", i + 1);
        cadastrarCarro(&(proprietario->carros[i]));
    }
}

// Função para exibir os dados de um proprietário e seus carros
void exibirProprietario(struct Proprietario proprietario) {
    printf("Nome: %s\n", proprietario.nome);
    printf("Idade: %d\n", proprietario.idade);
    printf("CPF: %s\n", proprietario.cpf);
    printf("RG: %s\n", proprietario.rg);
    printf("CNH: %s\n", proprietario.cnh);
    printf("Carros:\n");
    for (int i = 0; i < proprietario.num_carros; i++) {
        printf("  Carro %d:\n", i + 1);
        printf("    Marca: %s\n", proprietario.carros[i].marca);
        printf("    Modelo: %s\n", proprietario.carros[i].modelo);
        printf("    Ano: %d\n", proprietario.carros[i].ano);
    }
    printf("\n");
}

int main() {
    struct Proprietario proprietarios[100]; // Permitindo até 100 proprietários
    int num_proprietarios = 0;

    FILE *arquivo;

    int opcao;
    do {
        printf("Menu:\n");
        printf("1. Cadastrar novo proprietario\n");
        printf("0. Sair\n");
        printf("Escolha uma opcao: ");
        scanf("%d", &opcao);
        getchar();

        switch (opcao) {
            case 1:
                if (num_proprietarios < 100) {
                    printf("\n=== Cadastro de Proprietario ===\n");
                    cadastrarProprietario(&proprietarios[num_proprietarios]);
                    num_proprietarios++;
                } else {
                    printf("Limite de proprietarios atingido.\n");
                }
                break;
            case 0:
                arquivo = fopen("dados_proprietarios.bin", "wb");
                if (arquivo == NULL) {
                    printf("Erro ao abrir o arquivo.\n");
                    return 1;
                }
                fwrite(proprietarios, sizeof(struct Proprietario), num_proprietarios, arquivo);
                fclose(arquivo);

                printf("Saindo...\n");
                printf("\n=== Lista de Proprietarios e Carros ===\n");
                for (int i = 0; i < num_proprietarios; i++) {
                    exibirProprietario(proprietarios[i]);
                }
                break;
            default:
                printf("Opcao invalida. Tente novamente.\n");
        }
    } while (opcao != 0);

    return 0;
}
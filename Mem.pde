int ciclo = 0;    //Variável global que informa quantos ciclos, ou seja, quantas vezes uma sequência de iterações foi realizada.(Se necessário);
int passo = 0;    //Variável global que informa quantos passos, ou seja, quantas iterações foram realizadas dentro de um processo;

boolean criouListaCrescente = false;    //Informa se uma lista em ordem crescente já foi criada.
boolean criouListaDecrescente = false;    //             ||            decrescente         ||
boolean criouListaAleatoria = false;    //               ||    com valores aleatórios      ||
boolean embaralhou = false;    //Informa se houve ou não embaralhamento dos valores da lista durante a execução do sistema.

void desenhar(int[] listaMemoria) {                 //Função chamada para desenhar pontos ao longo de toda a largura do canvas,
  for (int ponto = 0; ponto < width; ponto++) {    //mantendo a proporção dos valores da lista com a altura do espaço onde se desenha;
    point(ponto, height-(listaMemoria[ponto]*height)/width);
  }
}
void criarLista_ordemCrescente(int[] listaMemoria) {    //Função chamada para alocar valores em ordem crescente ao longo do array introduzido;
  if (criouListaCrescente == false) {    //Caso uma lista de valores em ordem crescente ainda não tenha sido feita, o bloco de código é executado.
    if (passo < listaMemoria.length-1) {    //Caso o nº de passos não tenham excedido o maior índice do array, os processos das linhas 18 e 19 podem continuar a ser executados.
      for (int iteracao = 0; iteracao < 10; iteracao++) { //Essa linha serve apenas para "agilizar" a vizualização -- 'Faça 10 iterações antes que o proximo frame seja renderizado';
        listaMemoria[passo] = passo+1;
        passo++;
      }
    } else {                         //Caso uma lista de valores em ordem crescente já tenha sido feita,
      criouListaCrescente = true;    //sua respectiva variável booleana guarda essa informação
      passo = 0;                     //e o número de passos é resetado para ser usado em outro proceso;
    }
  }
}
void criarLista_ordemDecrescente(int[] listaMemoria) {    //Função chamada para alocar valores em ordem decrescente ao longo do array introduzido;
  if (criouListaDecrescente == false) {    //Caso uma lista de valores em ordem decrescente ainda não tenha sido feita, o bloco de código é executado.
    if (passo < listaMemoria.length-1) {    //Caso o nº de passos não tenham excedido o maior índice do array, os processos das linhas 31 e 32 podem continuar a ser executados.
      for (int iteracao = 0; iteracao < 10; iteracao++) { //Essa linha serve apenas para "agilizar" a vizualização -- 'Faça 10 iterações antes que o proximo frame seja renderizado';
        listaMemoria[passo] = listaMemoria.length - passo;
        passo++;
      }
    } else {                           //Caso uma lista de valores em ordem decrescente já tenha sido feita,
      criouListaDecrescente = true;    //sua respectiva variável booleana guarda essa informação
      passo = 0;                       //e o número de passos é resetado para ser usado em outro proceso;
    }
  }
}
void criarLista_Aleatoria(int[] listaMemoria) {    //Função chamada para alocar valores aleatórios ao longo do array introduzido;
  if (criouListaAleatoria == false) {    //Caso uma lista de valores aleatorios ainda não tenha sido feita, o bloco de código é executado.
    if (listaMemoria[listaMemoria.length-1] == 0) { //Enquanto o maior índice do array tiver um valor alocado igual a 0, os processos das linhas 44 e 45 podem continuar a ser executados.
      for (int iteracao = 0; iteracao < 10; iteracao++) {  //Essa linha serve apenas para "agilizar" a vizualização -- 'Faça 10 iterações antes que o proximo frame seja renderizado';
        listaMemoria[passo] = int(random(listaMemoria.length));
        passo++;
      }
    } else {                         //Caso uma lista de valores aleatórios já tenha sido feita,
      criouListaAleatoria = true;    //sua respectiva variável booleana guarda essa informação
      passo = 0;                     //e o número de passos é resetado para ser usado em outro proceso;
    }
  }
}
void embaralhar(int[] listaMemoria) {    //Função chamada para realocar valores ao longo de um array, afim de tornar "bagunçados" valores já existentes;
  if (embaralhou == false) {    //Caso um "embaralhamento" não tenha sido feito, o próximo requerimento é realizado.
    if (criouListaAleatoria == false) {    //Caso uma lista de valores aleatórias não tenha sido feita, o próximo requerimento é realizado.
      if (criouListaDecrescente == true || criouListaCrescente == true) {    //Caso uma lista de valores em ordem crescente ou decrescente tenha sido feita, o bloco de código
        if (passo < listaMemoria.length) {                                   //poderá ser executado até que o passo atinja o maior valor possível, sem ultrapassar o número de valores do array;
          for (int iteracao = 0; iteracao < 10; iteracao++) { //Essa linha serve apenas para "agilizar" a vizualização -- 'Faça 10 iterações antes que o proximo frame seja renderizado';
            int numero_aleatorio = int(random(listaMemoria.length));  //Um número aleatório é gerado e usado para realizar uma troca entre
            trocar(listaMemoria, passo, numero_aleatorio);            //o valor de seu índice no array e o valor do índice do passo no array;
            passo++;
          }
        } else {              //Caso um "embaralhamento" já tenha sido feito,
          embaralhou = true;  //sua respectiva variável booleana guarda essa informação
          passo = 0;          //e o número de passos é resetado para ser usado em outro proceso;
        }
      }
    }
  }
}
void trocar(int[] listaMemoria, int anterior, int seguinte) {    //Função que troca
  int valor_temporario = listaMemoria[anterior];                 //o valor de um índice num array,
  listaMemoria[anterior] = listaMemoria[seguinte];               //por um valor de outro índice,
  listaMemoria[seguinte] = valor_temporario;                     //quando invocada;
}
void ordenar(int[] listaMemoria) {    //Função responsável por ordenar os valores aleatórios ou embaralhados,
  if (ciclo < listaMemoria.length) {  //de forma que o processo seja animado e exibido no programa principal.
    if (criouListaAleatoria == true || embaralhou == true) { //Caso a única ocorrência do programa tenha sido a criação de uma lista ordenada, não é necessário ordená-la novamente.
      for (int iteracao = 0; iteracao < 1500; iteracao++) { //Essa linha serve apenas para "agilizar" a vizualização -- 'Faça 1500 iterações antes que o proximo frame seja renderizado';
        if (listaMemoria[passo] > listaMemoria[passo+1]) {    //No caso de o valor do índice que está sendo verificado ser menor
          trocar(listaMemoria, passo, passo+1);               //do que aquele do índice seguinte, seus valores são invertidos.
        }
        passo++;                                              //No caso de não ser, verificamos se o próximo valor é menor que seu sucessor;
        if (passo >= listaMemoria.length - ciclo - 1) {    //Os passos e ciclos continuarão a sofrer iterações até que o número de ciclos ultrapasse
          passo = 0;                                       //a quantidade de valores do array, fazendo com que as iterações cessem, nos deixando
          ciclo++;                                         //uma lista de valores ordenados do maior para o menor.
        }
      }
    }
  }
}

import 'dart:io';

/*
  Avaliação: 04/06
    De acordo com o Domínio de Negócio/Escopo do seu projeto (tem que ser único - diferente 
    dos colegas e do exemplo de aula), elaborar 10 funções correlatas que tratem regras de
    negócio ou que de suporte a requisitos do projeto. As funções elaboradas deverá possuir:
      (i)  anonymous function e/ou arrow function (pelo menos 2 exemplos); 
      (ii) parâmetros posicionais obrigatórios e opcionais;
      (iii) parâmetros nomeados obrigatórios e opcionais; e - OOOOK
      (iv) testes unitários. 

  Como é avaliação, pode-se inserir comentários para explicar/justificar a solução/implementação. Caso não tenha, irei interpretar conforme apresentado.
  Critérios de Avaliação: (Tudo que estudamos durante o período)
    - Alinhamento com o escopo/domínio;
    - Complexidade e/ou relevância da função; 
    - Baixo acoplamento (capacidade de reuso) e coesão das definições; 
    - Coesão e coerência na sintaxe e semântica;
    - Legibilidade do código, nomenclatura sugestivas das funções, variáveis e parâmetros;
    - Uso correto e adequado do tratamento de erros e validações.
*/

// FUNCIONALIDADE: VENDA DE PRODUTOS DE INFORMÁTICA

void show() {
  var resultado = calcularDescontoProduto(
      precoTotalProduto: 500.0, percentualDesconto: 50.0);
  print(resultado);
}

/* REGRA: Se pagamento à vista(dinheiro/pix/boleto/débito) aplicar desconto padrão de 15% no 
  valor total do produto ou o percentual passado por parâmetro.
    Nome da Função: descontoPagamentoVista();
*/
double descontoPagamentoVista(
    {required String formaPagamento,
    required double precoProduto,
    required quantidadeProduto,
    double descontoPercentual = 15.0}) {
  double precoTotalProduto = 0.0;
  double precoToTalDesconto = 0.0;
  try {
    if (precoProduto > 0 && quantidadeProduto > 0 && descontoPercentual > 0) {
      precoTotalProduto = precoProduto * quantidadeProduto;
    } else {
      throw Exception(
          'Erro!!! Preço e/ou quantidade e/ou desconto percentual não pode ser um número negativo!');
    }
    if (formaPagamento == 'dinheiro' ||
        formaPagamento == 'pix' ||
        formaPagamento == 'boleto' ||
        formaPagamento == 'debito' && formaPagamento != '') {
      precoToTalDesconto =
          precoTotalProduto - (precoTotalProduto * (descontoPercentual / 100));
    } else {
      throw Exception(
          'Erro!!! Forma de Pagamento inválida! Somente pix, dinheiro, débito ou boleto');
    }
  } catch (e) {
    throw Exception(e);
  }
  return precoToTalDesconto;
}

/* REGRA: Se pagamento à prazo(crédito) aplicar juros padrão de 30% no valor total do produto ou 
  o percentual passado por parâmetro.
    Nome da Função: jurosPagamentoPrazo();
*/
double jurosPagamentoPrazo(
    {required String formaPagamento,
    required double precoProduto,
    required quantidadeProduto,
    double percentualJuros = 30.0}) {
  double precoTotalProduto = 0.0;
  double precoToTalJuros = 0.0;
  try {
    if (precoProduto > 0 && quantidadeProduto > 0 && percentualJuros > 0) {
      precoTotalProduto = precoProduto * quantidadeProduto;
    } else {
      throw Exception(
          'Erro!!! Preço e/ou quantidade e/ou desconto percentual não pode ser um número negativo!');
    }
    if (formaPagamento == 'credito' && formaPagamento != '') {
      precoToTalJuros =
          precoTotalProduto + (precoTotalProduto * (percentualJuros / 100));
    } else {
      throw Exception(
          'Erro!!! Forma de Pagamento inválida! Somente pix, dinheiro, débito ou boleto');
    }
  } catch (e) {
    throw Exception(e);
  }
  return precoToTalJuros;
}

/* REGRA: Função que parcela/divide o preço total do produto, adicionando um percentual de juros em cada parcela
    Nome da Função: parcelarPrecoTotalProduto();
*/
double parcelarPrecoTotalProduto(double precoProduto, int quantidadeProduto,
    int quantidadeParcelas, double percentualJurosParcela) {
  double precoTotalProduto = 0.0;
  double precoParcelaComJuros = 0.0;
  try {
    if (precoProduto > 0 &&
        quantidadeProduto > 0 &&
        quantidadeParcelas > 0 &&
        percentualJurosParcela > 0) {
      precoTotalProduto = precoProduto * quantidadeProduto;
    } else {
      throw Exception(
          'Erro!!! Preço e/ou quantidade do produto e/ou quantidade de parcelas e/ou percentual de juros não pode ser um número negativo e diferente de zero!');
    }
    double precoParcelaSemJuros = precoTotalProduto / quantidadeParcelas;
    precoParcelaComJuros = precoParcelaSemJuros +
        (precoParcelaSemJuros * (percentualJurosParcela) / 100);
  } catch (e) {
    throw Exception(e);
  }

  return precoParcelaComJuros;
}

/* REGRA: Função que valida o preço do Produto.
    Nome da Função: validarPrecoProduto();
*/
void validarPrecoProduto({required double precoProduto}) {
  if (precoProduto < 0) {
    throw Exception('Preço do produto não pode ser negativo!');
  }
  if (precoProduto == 0) {
    throw Exception('Preço do produto não pode ser zero');
  }
}

/* REGRA: Função que valida a quantidade do Produto.
    Nome da Função: validarQuantidadeProduto();
*/
void validarQuantidadeProduto({required double quantidadeProduto}) {
  if (quantidadeProduto < 0) {
    throw Exception('Quantidade do produto não pode ser um númemro negativo!');
  }
  if (quantidadeProduto == 0) {
    throw Exception('Quantidade do produto não pode ser zero');
  }
}

/* REGRA: Função que valida a quantidade de parcelas.
    Nome da Função: validarQuantidadeParcela();
*/
void validarQuantidadeParcela({required double quantidadeParcela}) {
  if (quantidadeParcela < 0) {
    throw Exception('Quantidade de parcela não pode ser um númemro negativo!');
  }
  if (quantidadeParcela == 0) {
    throw Exception('Quantidade de parcela não pode ser zero');
  }
}

/* REGRA: Função que valida o percentual de juros.
    Nome da Função: validarPercentualJuros();
*/
void validarPercentualJuros({required double percentualJuros}) {
  if (percentualJuros < 0) {
    throw Exception('Percentual de juros não pode ser um númemro negativo!');
  }
  if (percentualJuros == 0) {
    throw Exception('Percentual de juros não pode ser zero');
  }
}

/* REGRA: Função que calcula o lucro adquirido na venda de um determinado produto
    Nome da Função: calcularLucroVendaProduto();
*/
double calcularLucroVendaProduto(
    double valorVendaProduto, int quantidadeProduto,
    [double percentualLucro = 0.10]) {
  var precoTotal = valorVendaProduto * quantidadeProduto;
  var totalLucro = precoTotal * percentualLucro;
  return totalLucro;
}

/* REGRA: Função que calcula o preço total do produto utilizando arrow function
    Nome da Função: calcularPrecoTotalProduto();
*/
double calcularPrecoTotalProduto(double precoProduto, int quantidadeProduto) =>
    precoProduto * quantidadeProduto;

/* REGRA: Função que calcula desconto no preço total do produto utilizando arrow function
    Nome da Função:  calcularDescontoProduto();
*/
double calcularDescontoProduto(
        {required double precoTotalProduto,
        required double percentualDesconto}) =>
    precoTotalProduto - (precoTotalProduto * (percentualDesconto / 100));

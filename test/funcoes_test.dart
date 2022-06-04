import 'package:teste/funcoes.dart';
import 'package:test/test.dart';

void main() {
  test('Calcular desconto para pagamento a vista', () {
    expect(
        descontoPagamentoVista(
            formaPagamento: 'pix', precoProduto: 100.00, quantidadeProduto: 3),
        255.0);
  });

  test('Calcular juros para pagamento a prazo', () {
    expect(
        jurosPagamentoPrazo(
            formaPagamento: 'credito',
            precoProduto: 100.00,
            quantidadeProduto: 3),
        390.0);
  });

  test('Parcelar preço total de um produto', () {
    expect(parcelarPrecoTotalProduto(100.00, 3, 4, 15.0), 86.25);
  });

  test('Validar preço do produto', () {
    expect(() => validarPrecoProduto(precoProduto: 0.0), throwsException);
  });

  test('Validar quantidade do produto', () {
    expect(
        () => validarQuantidadeProduto(quantidadeProduto: -3), throwsException);
  });

  test('Validar Quantidade de parcelas', () {
    expect(
        () => validarQuantidadeParcela(quantidadeParcela: -2), throwsException);
  });

  test('Validar Percentual de Juros', () {
    expect(
        () => validarPercentualJuros(percentualJuros: -10.0), throwsException);
  });

  test('Calcular lucro de venda de um produtos', () {
    expect(calcularLucroVendaProduto(550.0, 2), 110.0);
  });

  test('Calcular preco total de um produto utilizando arrow function', () {
    expect(calcularPrecoTotalProduto(50.0, 2), 100.0);
  });

  test(
      'Calcular desconto no preço total de um produto utilizando arrow function',
      () {
    expect(
        calcularDescontoProduto(
            precoTotalProduto: 500.0, percentualDesconto: 50.0),
        250.0);
  });
}

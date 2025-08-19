void main() {
  String nome = "Felipe Sousa";
  String letraInicial = "F";

  print('Simulando entrada de usuário:');
  print('Nome completo digitado: "$nome"');
  print('Inicial digitada: "$letraInicial"');
  print('');

  if (nome.trim().isEmpty) {
    print('Nome completo não fornecido. Saindo do programa.');
    return;
  }

  String initial;
  if (letraInicial.isNotEmpty && letraInicial.trim().isNotEmpty) {
    initial = letraInicial.trim()[0];
  } else {
    initial = '';
    print('Nenhuma inicial foi informada. Usando um valor vazio.');
  }

  print('\n--- Confirmação ---');
  print('Nome completo informado: $nome');
  print('Inicial do primeiro nome informada: ${initial.isEmpty ? "[N/A]" : initial}');
}
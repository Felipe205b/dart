import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: AlunoFiltroTela(),
  ));
}

class Aluno {
  final String nome;
  final double nota;

  Aluno({required this.nome, required this.nota});
}

class AlunoFiltroTela extends StatefulWidget {
  @override
  _AlunoFiltroTelaState createState() => _AlunoFiltroTelaState();
}

class _AlunoFiltroTelaState extends State<AlunoFiltroTela> {
  final TextEditingController _notaController = TextEditingController();
  List<Aluno> alunos = [
    Aluno(nome: 'Felipe', nota: 8.5),
    Aluno(nome: 'Maria', nota: 6.0),
    Aluno(nome: 'João', nota: 7.2),
    Aluno(nome: 'Ana', nota: 9.0),
    Aluno(nome: 'Pedro', nota: 5.5),
  ];

  double? notaMinima;
  List<Aluno> alunosFiltrados = [];

  @override
  void initState() {
    super.initState();
    alunosFiltrados = List.from(alunos); // inicializa com todos os alunos
  }

  void filtrarAlunos() {
    setState(() {
      if (_notaController.text.isEmpty) {
        alunosFiltrados = List.from(alunos);
        return;
      }

      notaMinima = double.tryParse(_notaController.text);

      if (notaMinima != null) {
        alunosFiltrados = alunos
            .where((aluno) => aluno.nota >= notaMinima!)
            .toList();
      } else {
        alunosFiltrados = List.from(alunos); // caso a nota não seja válida
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrar Alunos por Nota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _notaController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Nota mínima',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _notaController.clear();
                    filtrarAlunos();
                  },
                ),
              ),
              onChanged: (_) => filtrarAlunos(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: alunosFiltrados.isEmpty
                  ? Center(child: Text('Nenhum aluno encontrado.'))
                  : ListView.builder(
                      itemCount: alunosFiltrados.length,
                      itemBuilder: (context, index) {
                        final aluno = alunosFiltrados[index];
                        return ListTile(
                          title: Text(aluno.nome),
                          trailing: Text(aluno.nota.toStringAsFixed(1)),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

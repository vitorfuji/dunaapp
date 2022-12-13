import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class PerfilUsuarioTela extends StatefulWidget {
  const PerfilUsuarioTela({super.key});

  @override
  State<PerfilUsuarioTela> createState() => _PerfilUsuarioTelaState();
}

class _PerfilUsuarioTelaState extends State<PerfilUsuarioTela> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  final _controlador = TextEditingController();
  List<String> listaNomes = [];

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  void initState() {
    //Atualizacao Inicial
    refresh();

    //Atualizacao em Tempo Real
    db.collection('cadastro').snapshots().listen((query) {
      listaNomes = [];

      query.docs.forEach((doc) {
        setState(() {
          listaNomes.add(doc.get('name'));
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha pequena agenda'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => refresh(),
        child: const Icon(Icons.refresh),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Vamos gravar um nome na nuvem?',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: _controlador,
              decoration: const InputDecoration(labelText: 'Insira seu nome'),
            ),
            ElevatedButton(
              onPressed: () => sendData(),
              child: const Text('Enviar'),
            ),
            const SizedBox(height: 16),
            (listaNomes.isEmpty)
                ? const Text(
                    'Nenhum contato registrado',
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  )
                : Column(
                    children: [
                      for (String s in listaNomes) Text(s),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  void refresh() async {
    //atualizacao manual
    QuerySnapshot query = await db.collection('cadastro').get();

    listaNomes = [];

    query.docs.forEach((doc) {
      String name = doc.get('name');
      setState(() {
        listaNomes.add(name);
      });
    });
  }

  void sendData() {
    //Geracao do ID
    String id = const Uuid().v1();
    db.collection('cadastro').doc(id).set({
      'name': _controlador.text,
    });

    //Feedback visual
    _controlador.text = '';
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Salvo na Firestore')));
  }
}

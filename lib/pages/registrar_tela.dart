import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/background_image.dart';

class RegistrarTela extends StatefulWidget {
  const RegistrarTela({super.key});

  @override
  State<RegistrarTela> createState() => _RegistrarTelaState();
}

class _RegistrarTelaState extends State<RegistrarTela> {
  // controladores
  final _nomeControlador = TextEditingController();
  final _sobrenomeControlador = TextEditingController();
  final _emailControlador = TextEditingController();
  final _senhaControlador = TextEditingController();
  final _senhaConfirmadaControlador = TextEditingController();

  @override
  void dispose() {
    _nomeControlador.dispose();
    _sobrenomeControlador.dispose();
    _emailControlador.dispose();
    _senhaControlador.dispose();
    _senhaConfirmadaControlador.dispose();
    super.dispose();
  }

  Future criarConta() async {
    if (senhaConfirmada()) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailControlador.text.trim(),
              password: _senhaControlador.text.trim())
          .then((value) =>
              Navigator.canPop(context) ? Navigator.pop(context) : null);
    }
  }

  //bool que checa se a senha e o confirmar senha sao iguais
  bool senhaConfirmada() {
    if (_senhaControlador.text.trim() ==
        _senhaConfirmadaControlador.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Text(
                    'Seja bem vindo!',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 185, 156, 67),
                    ),
                  ),
                  const SizedBox(height: 15),

                  //Campo Texto Registrar
                  const Text(
                    textAlign: TextAlign.center,
                    'Registre-se abaixo preenchendo com seus detalhes!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 185, 156, 67),
                    ),
                  ),
                  const SizedBox(height: 5),

                  //Campo Nome
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          controller: _nomeControlador,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Nome',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Campo Sobrenome
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          controller: _sobrenomeControlador,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Sobrenome',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Campo Email
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          controller: _emailControlador,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Campo Senha
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          controller: _senhaControlador,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Senha',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Campo Confirmar Senha
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          controller: _senhaConfirmadaControlador,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirmar Senha',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: criarConta,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 185, 156, 67),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            'Criar conta',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

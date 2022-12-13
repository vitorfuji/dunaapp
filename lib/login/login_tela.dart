import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/background_image.dart';
import '../esqueceu_senha/esqueceusenha_tela.dart';
import '../widgets/input_field.dart';

class LoginTela extends StatefulWidget {
  const LoginTela({super.key});

  @override
  State<LoginTela> createState() => _LoginTelaState();
}

class _LoginTelaState extends State<LoginTela> {
  //Controladores
  final TextEditingController _emailControlador =
      TextEditingController(text: '');
  final TextEditingController _senhaControlador =
      TextEditingController(text: '');

  Future entrarUsuario() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailControlador.text.trim(),
            password: _senhaControlador.text.trim())
        .then((value) =>
            Navigator.canPop(context) ? Navigator.pop(context) : null);
  }

  @override
  void dispose() {
    _emailControlador.dispose();
    _senhaControlador.dispose();
    super.dispose();
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
                  const SizedBox(height: 150),
                  Text(
                    'Olá novamente!',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 52,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),

                  //Campo Texto Registrar
                  const Text(
                    textAlign: TextAlign.center,
                    'Sentimos a sua falta!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),

                  //Campo Email
                  InputField(
                    hintText: 'Email',
                    icon: Icons.email_outlined,
                    obscureText: false,
                    textEditingController: _emailControlador,
                  ),

                  //Campo Senha
                  InputField(
                    hintText: 'Email',
                    icon: Icons.lock,
                    obscureText: true,
                    textEditingController: _senhaControlador,
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const EsqueceuSenhaTela();
                            }));
                          },
                          child: const Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 15.0),
                    child: GestureDetector(
                      onTap: entrarUsuario,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 185, 156, 67),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            'Entrar',
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

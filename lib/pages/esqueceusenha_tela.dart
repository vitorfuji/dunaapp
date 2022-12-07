import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/background_image.dart';

class EsqueceuSenhaTela extends StatefulWidget {
  const EsqueceuSenhaTela({super.key});

  @override
  State<EsqueceuSenhaTela> createState() => _EsqueceuSenhaTelaState();
}

class _EsqueceuSenhaTelaState extends State<EsqueceuSenhaTela> {
  //controladores
  final _emailControlador = TextEditingController();

  @override
  void dispose() {
    _emailControlador.dispose();
    super.dispose();
  }

  Future senhaRedefinida() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailControlador.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text(
                'Link enviado! Checar seu Email!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            );
          });
    } on FirebaseAuthException {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              backgroundColor: Color.fromARGB(255, 185, 156, 67),
              content: Text(
                'Não existe nenhum usuário com esse email, por favor entre um Email válido!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            );
          });
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  'Entre seu Email para receber um link para redefinir sua senha!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              //Campo Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                        color: Colors.white,
                      ),
                      controller: _emailControlador,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.email_outlined,
                          color: Color.fromARGB(255, 185, 156, 67),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              MaterialButton(
                onPressed: senhaRedefinida,
                color: const Color.fromARGB(255, 185, 156, 67),
                child: const Text(
                  'Redefinir Senha',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/background_image.dart';
import 'login_tela.dart';
import 'registrar_tela.dart';

class BemVindoTela extends StatelessWidget {
  const BemVindoTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: SizedBox(
                      height: 50,
                      child: ListTile(
                        title: Center(
                          child: Text(
                            'Duna Beach Sports',
                            style: GoogleFonts.bebasNeue(
                              color: const Color.fromARGB(255, 185, 156, 67),
                              fontSize: 52,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: const Center(
                          child: Text(
                            'A melhor parte do seu dia!',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 500),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Ja possui uma conta no ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Duna',
                          style: TextStyle(color: Colors.amber),
                        ),
                        Text(
                          ' ?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 185, 156, 67),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrarTela()),
                              );
                            },
                            child: const Text(
                              'Criar uma conta',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 12.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 185, 156, 67),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginTela()),
                              );
                            },
                            child: const Text(
                              'Acessar minha conta',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

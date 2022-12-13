import 'package:dunaapp/bemvindo/bemvindo_tela.dart';
import 'package:dunaapp/home_screen/home_tela.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeTela();
          } else {
            return const BemVindoTela();
          }
        },
      ),
    );
  }
}

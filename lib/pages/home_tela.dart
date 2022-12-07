import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeTela extends StatefulWidget {
  const HomeTela({super.key});

  @override
  State<HomeTela> createState() => _HomeTelaState();
}

class _HomeTelaState extends State<HomeTela> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black87,
      // ),
      // drawer: Drawer(
      //   child: Container(
      //     color: const Color.fromARGB(255, 185, 153, 55),
      //     child: ListView(
      //       children: [
      //         DrawerHeader(
      //           child: Image.asset(
      //             'lib/images/duna7.png',
      //             fit: BoxFit.fitWidth,
      //           ),
      //         ),
      //         ListTile(
      //           leading: const Icon(
      //             Icons.home,
      //             color: Colors.white,
      //             size: 35,
      //           ),
      //           title: const Text(
      //             'Início',
      //             style: TextStyle(
      //               fontSize: 20,
      //               color: Colors.white,
      //             ),
      //           ),
      //           onTap: () {
      //             Navigator.of(context).push(MaterialPageRoute(
      //                 builder: (context) => const HomeTela()));
      //           },
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Logado como: ${user.email!}'),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.amber,
              child: const Text('Sair'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            padding: const EdgeInsets.all(16),
            gap: 2,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Página Inicial',
              ),
              GButton(
                icon: Icons.calendar_month,
                text: 'Agenda',
              ),
              GButton(
                icon: Icons.discount,
                text: 'Promoções',
              ),
              GButton(
                icon: Icons.person,
                text: 'Perfil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

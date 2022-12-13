import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/background_image.dart';
import '../widgets/input_field.dart';

class RegistrarTela extends StatefulWidget {
  const RegistrarTela({super.key});

  @override
  State<RegistrarTela> createState() => _RegistrarTelaState();
}

class _RegistrarTelaState extends State<RegistrarTela> {
  void _showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Por favor, escolha uma das opções:'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    //Pegar da camera
                    _pegarDaCamera();
                  },
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.camera,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'Câmera',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //Pegar da galeria
                    _pegarDaGaleria();
                  },
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.image,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'Galeria',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _pegarDaCamera() async {
    final XFile? arquivoEscolhido =
        await ImagePicker().pickImage(source: ImageSource.camera);
    _cortarImagem(arquivoEscolhido!.path);
    Navigator.pop(context);
  }

  void _pegarDaGaleria() async {
    final XFile? arquivoEscolhido =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    _cortarImagem(arquivoEscolhido!.path);
    Navigator.pop(context);
  }

  void _cortarImagem(filePath) async {
    CroppedFile? imagemCortada = await ImageCropper()
        .cropImage(sourcePath: filePath, maxHeight: 1080, maxWidth: 1080);

    setState(() {
      imagemArquivo = File(imagemCortada!.path);
    });
  }

  File? imagemArquivo;

  // controladores
  final _nomeControlador = TextEditingController();
  final _sobrenomeControlador = TextEditingController();
  final _celularControlador = TextEditingController();
  final _emailControlador = TextEditingController();
  final _senhaControlador = TextEditingController();
  final _senhaConfirmadaControlador = TextEditingController();

  @override
  void dispose() {
    _nomeControlador.dispose();
    _sobrenomeControlador.dispose();
    _emailControlador.dispose();
    _celularControlador.dispose();
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
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    'CRIAR CONTA!',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 185, 156, 67),
                    ),
                  ),
                  const SizedBox(height: 10),

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

                  GestureDetector(
                    onTap: () {
                      _showImageDialog();
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: imagemArquivo == null
                          ? const AssetImage('lib/images/duna.jpg')
                          : Image.file(imagemArquivo!).image,
                    ),
                  ),
                  //Campo Nome
                  InputField(
                    hintText: 'Nome',
                    icon: Icons.person,
                    obscureText: false,
                    textEditingController: _nomeControlador,
                  ),

                  //Campo Sobrenome
                  InputField(
                    hintText: 'Sobrenome',
                    icon: Icons.person,
                    obscureText: false,
                    textEditingController: _sobrenomeControlador,
                  ),

                  InputField(
                    hintText: 'Celular',
                    icon: Icons.phone,
                    obscureText: false,
                    textEditingController: _celularControlador,
                  ),

                  //Campo Email
                  InputField(
                    hintText: 'Email',
                    icon: Icons.email,
                    obscureText: false,
                    textEditingController: _emailControlador,
                  ),

                  //Campo Senha
                  InputField(
                    hintText: 'Senha',
                    icon: Icons.lock,
                    obscureText: true,
                    textEditingController: _senhaControlador,
                  ),

                  //Campo Confirmar Senha
                  InputField(
                    hintText: 'Confirmar Senha',
                    icon: Icons.lock,
                    obscureText: true,
                    textEditingController: _senhaConfirmadaControlador,
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

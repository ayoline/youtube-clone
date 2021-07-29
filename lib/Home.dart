import 'package:flutter/material.dart';
import 'package:youtube_clone/telas/Biblioteca.dart';
import 'package:youtube_clone/telas/EmAlta.dart';
import 'package:youtube_clone/telas/Inicio.dart';
import 'package:youtube_clone/telas/Inscricao.dart';
import 'CustomSearchDelegate.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String _resultado = '';

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1,
        ),
        backgroundColor: Colors.white,
        title: Image.asset("images/youtube.png", width: 98, height: 22),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String? res = await showSearch(
                  context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res!;
              });
            },
          ),

          /*
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {
              print('ação: video Cam');
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              print('ação: conta');
            },
          ),

          */
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      // Adiciona a barra de navegação inferior
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        currentIndex: _indiceAtual, // fixa o icon selecionado inicialmente
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(label: 'Início', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Em alta', icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              label: 'Inscrições', icon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(
              label: 'Biblioteca', icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}

//teste
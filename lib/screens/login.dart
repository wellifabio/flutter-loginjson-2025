import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';

class Login extends StatefulWidget {
  final String? title;
  const Login({super.key, this.title});
  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  String email = 'ana@email.com';
  String senha = 'senai123';
  List<dynamic> usuarios = [];
  bool _senhaVisivel = false;

  @override
  void initState() {
    super.initState();
    carregarUsuarios();
  }

  // Carrega o JSON dos assets
  Future<void> carregarUsuarios() async {
    final String response = await rootBundle.loadString('assets/dados.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      usuarios = data;
    });
  }

  void validar(BuildContext context) {
    final usuarioValido = usuarios.firstWhere(
      (user) => user['email'] == email && user['senha'] == senha,
      orElse: () => null,
    );

    if (usuarioValido != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(title: 'Home ${usuarioValido['nome']}'),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Erro"),
            content: Text("Email ou senha inválidos"),
            actions: [
              ElevatedButton(
                child: Text("Fechar"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString()),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('E-mail:'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite seu e-mail:',
              ),
              onChanged: (text) {
                email = text;
              },
            ),
            Text('Senha:'),
            TextField(
              obscureText: !_senhaVisivel,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite sua senha:',
                suffixIcon: IconButton(
                  icon: Icon(
                    _senhaVisivel ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _senhaVisivel = !_senhaVisivel;
                    });
                  },
                ),
              ),
              onChanged: (text) {
                senha = text;
              },
            ),
            ElevatedButton(
              onPressed: () {
                validar(context);
              },
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}

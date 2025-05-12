import 'package:flutter/material.dart';
import 'package:telalogin/data/users_data.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class Login extends StatefulWidget {
  final String? title;
  const Login({super.key, this.title});
  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  String email = '';
  String senha = '';

  validar(context) {
    setState(() {
      if (email == 'aluno@email.com' && senha == 'senha123') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home(title: 'Home')),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Erro"),
              content: Text("Email ou senha inválidos"),
              actions: <Widget>[
                ElevatedButton(
                  child: Text("Fechar"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite sua senha:',
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
      ),
    );
  }
}

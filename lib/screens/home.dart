import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String? title;
  const Home({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(this.title.toString()),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Bem vindo'),
              ElevatedButton(onPressed: (){Navigator.pop(context);}, child: const Text('Sair'))
            ],
          ),
        ),
      ),
    );
  }
}

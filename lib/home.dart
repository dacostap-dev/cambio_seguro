import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Prueba técnica'),
        ),
        body: ListView(
          children: [
            ListTile(
              onTap: () => Navigator.pushNamed(context, 'exchange-rate'),
              title: const Text('Tipo de cambio'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () => Navigator.pushNamed(context, 'articles'),
              title: const Text('Lista de articulos'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ));
  }
}

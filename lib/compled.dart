import 'package:flutter/material.dart';

class Compled extends StatelessWidget {
  const Compled({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş başarılı'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            'Giriş başarılı',
            style: TextStyle(fontSize: 50),
          )
        ],
      ),
    );
  }
}

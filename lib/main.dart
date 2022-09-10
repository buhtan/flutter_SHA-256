import 'package:flutter/material.dart';

import 'giris.dart';
import 'kayit_ol.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sha-256 kulanımı',
      theme: ThemeData.dark().copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Colors.red, 
          onPrimary: Colors.white,
        ),
      )),
      home: Giris(),
    );
  }
}

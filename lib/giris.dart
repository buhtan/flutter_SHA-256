import 'package:flutter/material.dart';
import 'package:odev3/compled.dart';
import 'package:odev3/kayit_ol.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class Giris extends StatelessWidget {
  Giris({super.key});
  TextEditingController _IDcontroller = TextEditingController();
  TextEditingController _Pwcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _IDcontroller,
          ),
          TextField(
            controller: _Pwcontroller,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
          ),
          ElevatedButton(
              onPressed: () async {
                final preferences = await SharedPreferences.getInstance();

                //hash kodu eşleşme
                var bytes =
                    utf8.encode(_Pwcontroller.text); // data being hashed

                var hashkodu = sha256.convert(bytes);

                if (_IDcontroller.text == preferences.getString('id') &&
                    _Pwcontroller.text ==
                        preferences.getString(hashkodu.toString())) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Compled();
                  }));
                  print(hashkodu);
                }
              },
              child: Text('Giriş')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return kayitOl();
                }));
              },
              child: Text('kayıt ol')),
        ],
      ),
    );
  }
}

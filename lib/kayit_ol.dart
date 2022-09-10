import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class kayitOl extends StatelessWidget {
  kayitOl({super.key});

  TextEditingController _IDcontroller = TextEditingController();
  TextEditingController _Pwcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kayit ol'),
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
                preferences.setString('id', _IDcontroller.text);

                //şifreleme
                var bytes =
                    utf8.encode(_Pwcontroller.text); // data being hashed

                var hashkodu = sha256.convert(bytes);

                preferences.setString(hashkodu.toString(), _Pwcontroller.text);
                print(hashkodu);
              },
              child: Text('Kayit ol')),
        ],
      ),
    );
  }
}

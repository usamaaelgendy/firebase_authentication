import 'package:firebase_authentication/auth/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  HomePage({this.auth, this.onSignedOut});

  void _signOut() async {
    try {
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "SignOut",
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
            onPressed: _signOut,
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Text(
            "Welcome",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

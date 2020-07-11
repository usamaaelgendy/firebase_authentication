import 'package:firebase_authentication/auth/auth.dart';
import 'package:firebase_authentication/login_page.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  final BaseAuth auth;

  RootPage({this.auth});

  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus {
  notSignIn,
  signIn,
}

class _RootPageState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.notSignIn;

  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
//        _authStatus = userId == null ? AuthStatus.notSignIn : AuthStatus.signIn;
      });
    });
  }

  void _signedIn(){
    setState(() {
      _authStatus = AuthStatus.signIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    switch (_authStatus) {
      case AuthStatus.notSignIn:
        return LoginPage(
          auth: widget.auth,
          onSignIn: _signedIn,
        );
        break;
      case AuthStatus.signIn:
        return Container(
          child: Text("hello"),
        );
        break;
    }
  }
}

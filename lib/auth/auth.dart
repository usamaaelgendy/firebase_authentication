import 'package:firebase_auth/firebase_auth.dart';

// we can make object from abstract class (interface)
abstract class BaseAuth {
  // abstract method

  // todo : sign In
  Future<String> signInWithEmailAndPassword(String email, String password);

  // todo : create an account
  Future<String> createAccountWithEmailAndPassword(
      String email, String password);

  // todo : get current user
  Future<String> currentUser();
}

class Auth implements BaseAuth {
  // first this method will be void .. then call it's future
  @override
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    AuthResult user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return user.user.uid;
  }

  @override
  Future<String> createAccountWithEmailAndPassword(
      String email, String password) async {
    AuthResult user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    return user.user.uid;
  }

  @override
  Future<String> currentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }
}

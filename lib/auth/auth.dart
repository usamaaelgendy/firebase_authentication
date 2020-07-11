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

  Future<void> signOut();
}

class Auth implements BaseAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // first this method will be void .. then call it's future
  @override
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    AuthResult user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user.uid;
  }

  @override
  Future<String> createAccountWithEmailAndPassword(
      String email, String password) async {
    AuthResult user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return user.user.uid;
  }

  @override
  Future<String> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.uid;
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}

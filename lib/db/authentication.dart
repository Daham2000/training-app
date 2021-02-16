import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  static Authentication authentication;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get authStateChanged => _firebaseAuth.authStateChanges();

  factory Authentication() {
    if (authentication == null) {
      authentication = Authentication._internal();
    }
    return authentication;
  }

  Authentication._internal();

  Future<UserCredential> login(String email, String password) async {
    final UserCredential result =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result;
  }

  Future<String> register(String email, String password) async {
    try {
      final UserCredential result =
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('SignUp Success');
      return result.user.email;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return('The account already exists for that email.');
      }
    }
  }
}

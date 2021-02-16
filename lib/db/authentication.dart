import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  static Authentication authentication;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  factory Authentication() {
    if (authentication == null) {
      authentication = Authentication._internal();
    }
    return authentication;
  }

  Authentication._internal();

  Future<String> login(String email, String password) async {
    final UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user.email;
  }

  Future<String> register(String email, String password) async {
    final UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user.email;
  }


}

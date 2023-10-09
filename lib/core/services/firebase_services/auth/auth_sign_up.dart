import 'package:firebase_auth/firebase_auth.dart';

class AuthSignUp {
  FirebaseAuth auth = FirebaseAuth.instance;
  signUp({required String email, required String password}) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}

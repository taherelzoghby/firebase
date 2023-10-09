import 'package:firebase_auth/firebase_auth.dart';

class AuthSignIn {
  FirebaseAuth auth = FirebaseAuth.instance;
  signIn({required String email, required String password}) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }
}

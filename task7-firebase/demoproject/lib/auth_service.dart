import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> signUp(String email, String password) async {
    try {
      UserCredential uc = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (uc.user != null) {
        return "Sign up successful";
      }
    } catch (e) {
      return e.toString();
    }
    return "";
  }

  Future<String> signIn(String email, String password) async {
    try {
      UserCredential uc = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (uc.user != null) {
        return "Sign up successful";
      }
    } catch (e) {
      return e.toString();
    }
    return "";
  }

  signOut() async {
    await auth.signOut();
  }
}

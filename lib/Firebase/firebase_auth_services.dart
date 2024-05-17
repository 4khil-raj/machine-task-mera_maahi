import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  //Step1 ( this is the Firebase instance )
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Step2 ( calling a method for SignUp with  email and password )
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print('Some error occurred in SignUp');
    }
    return null;
  }

  //Step2 ( Calling another method for SignIn with Email and Password )

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error occurred in SignIn");
    }
    return null;
  }
}

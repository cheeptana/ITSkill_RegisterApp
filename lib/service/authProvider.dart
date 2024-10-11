import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (user != null) {
        Fluttertoast.showToast(
            msg: "Login successfully",
            toastLength: Toast.LENGTH_LONG,
            fontSize: 13.0);
        return true;
      } else
        return false;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return false;
    }
  }

  Future<bool> createUserWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (user != null) {
        Fluttertoast.showToast(
            msg: "Signup successfully",
            toastLength: Toast.LENGTH_LONG,
            fontSize: 13.0);
        return true;
      } else
        return false;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return false;
    }
  }
}

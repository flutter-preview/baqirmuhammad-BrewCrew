import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on firebase user
  CustomUser? _userfromUser(User? user) {
    return user != null ? CustomUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<CustomUser?> get user {
    return _auth.authStateChanges().map(_userfromUser);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      // ignore: unused_local_variable
      User? user = result.user;
      return _userfromUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign in with email

  //register

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Stream<User> get user{
    return _auth.authStateChanges();
  }
  //Register
  Future signUp(String email, String Password) async{

    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: Password);
      return result.user;
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

  //Sign in
  Future signIn(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }
  //Log out
  Future logOut() async{
    try{
    return _auth.signOut();
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }

}
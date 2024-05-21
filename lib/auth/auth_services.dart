import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? getCurrentUser(){
   return _auth.currentUser!;
  }

  Future<UserCredential> signIn(String email,String password) async{

    try{
       print("your credential $email $password");
       UserCredential credencial = await _auth.signInWithEmailAndPassword(email: email, password: password);
       
       return credencial;
    }on FirebaseAuthException catch(e){

      throw Exception(e.code);
    }
   
  }
  Future<UserCredential> signUp(String email,String password) async{

    try{
       UserCredential credencial = await _auth.createUserWithEmailAndPassword(email: email, password: password);
       return credencial;
    }on FirebaseAuthException catch(e){

      throw Exception(e.code);
    }
   
  }

  Future<void> signOut() async{
    return await _auth.signOut();
  }
}